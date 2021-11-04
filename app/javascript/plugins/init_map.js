// app/javascript/plugins/init_mapbox.js
import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';

const initMap = () => {
  const mapElement = document.getElementById('map');
  const tour = document.getElementById('tour');
  const locations = document.querySelectorAll('.locations');

  if (mapElement) {
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10',
      center: [tour.dataset.long, tour.dataset.lat],
      zoom: 16.5
    });

    locations.forEach(location => {
      new mapboxgl.Marker({
        'name': location.dataset.name
      })
          .setLngLat([location.dataset.long, location.dataset.lat])
          .addTo(map);
    });

    map.on('load', () => {
      map.addSource('route', {
        'type': 'geojson',
        'data': {
          'type': 'Feature',
          'properties': {},
          'geometry': {
            'type': 'LineString',
            'coordinates': [
              [
                -66.9140875339508,
                10.50658959363517
              ],
              [
                -66.91421091556549,
                10.505909185238535
              ],
              [
                -66.91427528858185,
                10.505466127802645
              ],
              [
                -66.91303074359894,
                10.505191853833454
              ],
              [
                -66.91319167613983,
                10.504500893331862
              ]
            ]
          }
        }
      });

      map.addLayer({
        'id': 'route',
        'type': 'line',
        'source': 'route',
        'layout': {
          'line-join': 'round',
          'line-cap': 'round'
        },
        'paint': {
          'line-color': '#888',
          'line-width': 8
        }
      });
    });

    map.on('click', () => {
      console.log('Just clicked the map');
      window.location.href = "ar_experience";
    });

  }
};

export { initMap };
