import mapboxgl from "mapbox-gl";
import "mapbox-gl/dist/mapbox-gl.css";
const initMapbox = () => {
  const mapElement = document.getElementById("map");
  // console.log(mapElement);

  if (mapElement) {
    // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = process.env.MAPBOX_API_KEY;
    const marker = JSON.parse(mapElement.dataset.marker);
    const map = new mapboxgl.Map({
      container: "map",
      style: "mapbox://styles/jakem93/cks4h3d3m4obr17q6tm5vm4td",
      zoom: 15, // starting zoom
      center: [marker.lat, marker.lng], // starting center
    });
    map.addControl(new mapboxgl.FullscreenControl());

    // markers.forEach((marker) => {
    new mapboxgl.Marker({ color: "black" })
      .setLngLat([marker.lng, marker.lat])
      .addTo(map);
    // });

    const fitMapToMarkers = (map, marker) => {
      const bounds = new mapboxgl.LngLatBounds();
      // markers.forEach((marker) => bounds.extend([marker.lng, marker.lat]));
      bounds.extend([marker.lng, marker.lat]);
      map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
    };
    fitMapToMarkers(map, marker);
  }
};

export { initMapbox };
