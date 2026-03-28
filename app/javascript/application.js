// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"

document.addEventListener("turbo:load", () => {

  const mapElement = document.getElementById("map")

  if (mapElement) {

    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey

    const markers = JSON.parse(mapElement.dataset.markers)

    const map = new mapboxgl.Map({
      container: "map",
      style: "mapbox://styles/mapbox/standard",
      center: [-46.63, -23.55],
      zoom: 10
    })

    markers.forEach((marker) => {
      new mapboxgl.Marker()
        .setLngLat([marker.lng, marker.lat])
        .addTo(map)
    })

  }

})
