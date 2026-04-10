class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :runs, dependent: :destroy
  has_many :run_members, dependent: :destroy
  has_many :runs_joined, through: :run_members, source: :run
  has_many :messages, dependent: :destroy
  has_many :sent_chats,     class_name: "Chat", foreign_key: :sender_id,   dependent: :destroy
  has_many :received_chats, class_name: "Chat", foreign_key: :receiver_id, dependent: :destroy

  enum gender: { male: 0, female: 1, other: 2 }

  def chats
    run_ids = runs.pluck(:id) + runs_joined.pluck(:id)
    Chat.where(sender: self)
        .or(Chat.where(receiver: self))
        .or(Chat.where(run_id: run_ids))
  end

  def unread_messages_count
    chat_ids = chats.pluck(:id)
    Message.where(chat_id: chat_ids).unread_for(self).count
  end

  # ─── GAMIFICAÇÃO ──────────────────────────────
  def points
    pts = 0
    pts += runs.count * 10                                          # criar corrida
    pts += run_members.count * 5                                    # participar
    pts += messages.count * 1                                       # mensagens
    pts += runs.where(women_only: true).count * 15                  # bônus feminina criada
    pts += runs_joined.where(women_only: true).count * 10           # bônus feminina participou
    pts
  end

  def level
    case points
    when 0..25   then 1
    when 26..50  then 2
    when 51..100 then 3
    when 101..200 then 4
    else 5
    end
  end

  def level_name
    case level
    when 1 then "Iniciante"
    when 2 then "Corredor"
    when 3 then "Corredor ativo"
    when 4 then "Maratonista"
    when 5 then "Lenda"
    end
  end

  def level_max_points
    case level
    when 1 then 25
    when 2 then 50
    when 3 then 100
    when 4 then 200
    else 500
    end
  end

  def level_min_points
    case level
    when 1 then 0
    when 2 then 26
    when 3 then 51
    when 4 then 101
    else 201
    end
  end

  def level_progress
    range = level_max_points - level_min_points
    current = points - level_min_points
    [(current.to_f / range * 100).round, 100].min
  end

  def badges
    list = []

    if runs.count + run_members.count >= 1
      list << { name: "Primeira corrida", icon: "check", color: "#4caf50", description: "+10 pts" }
    end

    if runs.count >= 3
      list << { name: "Criador ativo", icon: "users", color: "#c93c00", description: "3 corridas criadas" }
    end

    if runs.count >= 10
      list << { name: "Organizador", icon: "star", color: "#ffd700", description: "10 corridas criadas" }
    end

    if run_members.count >= 5
      list << { name: "Corredor social", icon: "heart", color: "#378add", description: "5 participações" }
    end

    if run_members.count >= 15
      list << { name: "Maratonista social", icon: "trophy", color: "#ffd700", description: "15 participações" }
    end

    if messages.count >= 50
      list << { name: "Social runner", icon: "message", color: "#378add", description: "50 mensagens" }
    end

    women_count = runs.where(women_only: true).count + runs_joined.where(women_only: true).count
    if women_count >= 3
      list << { name: "Corredora conectada", icon: "star", color: "#d946ef", description: "3 corridas femininas" }
    end

    list
  end

  def locked_badges
    list = []

    if runs.count + run_members.count < 1
      list << { name: "Primeira corrida", icon: "check", color: "#444", remaining: "Participe de 1 corrida" }
    end

    if runs.count < 3
      list << { name: "Criador ativo", icon: "users", color: "#444", remaining: "Falta: #{3 - runs.count} corridas" }
    end

    if run_members.count < 5
      list << { name: "Corredor social", icon: "heart", color: "#444", remaining: "Falta: #{5 - run_members.count} participações" }
    end

    if messages.count < 50
      list << { name: "Social runner", icon: "message", color: "#444", remaining: "Falta: #{50 - messages.count} mensagens" }
    end

    list
  end
end
