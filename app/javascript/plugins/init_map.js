// app/javascript/plugins/init_mapbox.js
import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';

// Global variables
const line_coordinates = [
  [
    -66.9140875339508,
    10.506518388175483
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
    -66.91317021846771,
    10.5045536384628
  ]
]

function nameFeatures(locations) {
  const features = [];
  locations.forEach((location, index) => {
    const feature = {
      'type': 'Feature',
      'geometry': {
        'type': 'Point',
        'coordinates': [location.dataset.long, location.dataset.lat]
      },
      'properties': {
        'title': location.dataset.name
      }
    }
    features.push(feature);
  });
  return features;
}

const initMap = () => {
  const mapElement = document.getElementById('map');
  const locations = document.querySelectorAll('.locations');
  const tour = document.getElementById('tour');

  if (mapElement) {
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10',
      center: [tour.dataset.long, tour.dataset.lat],
      zoom: 16.5,
      pitch: 45
    });

    function rotateCamera(timestamp) {
      // clamp the rotation between 0 -360 degrees
      // Divide timestamp by 100 to slow rotation to ~10 degrees / sec
      map.rotateTo((timestamp / 100) % 360, { duration: 0 });
      // Request the next frame of the animation.
      requestAnimationFrame(rotateCamera);
    }

    locations.forEach((location, index) => {
      console.log(tour.counter)
      if (tour.dataset.counter == (index - 1)) {
        new mapboxgl.Marker({
          'color': 'red'
        })
            .setLngLat([location.dataset.long, location.dataset.lat])
            .addTo(map);
      } else {
        new mapboxgl.Marker({
          'color': '#F68B64'
        })
            .setLngLat([location.dataset.long, location.dataset.lat])
            .addTo(map);
      }
    });

    map.on('load', () => {

      rotateCamera(0);

      const layers = map.getStyle().layers;
      for (const layer of layers) {
        if (layer.type === 'symbol' && layer.layout['text-field']) {
          // remove text labels
          map.removeLayer(layer.id);
        }
      }

      map.addSource('route', {
        'type': 'geojson',
        'data': {
          'type': 'Feature',
          'properties': {},
          'geometry': {
            'type': 'LineString',
            'coordinates':  line_coordinates
          }
        }
      });

      map.addSource('points', {
        'type': 'geojson',
        'data': {
          'type': 'FeatureCollection',
          'features': nameFeatures(locations)
        }
      });

      map.addLayer({
        'id': '3d-buildings',
        'source': 'composite',
        'source-layer': 'building',
        'filter': ['==', 'extrude', 'true'],
        'type': 'fill-extrusion',
        'minzoom': 15,
        'paint': {
          'fill-extrusion-color': 'grey',

          // use an 'interpolate' expression to add a smooth transition effect to the
          // buildings as the user zooms in
          'fill-extrusion-height': [
            'interpolate',
            ['linear'],
            ['zoom'],
            15,
            0,
            15.05,
            ['get', 'height']
          ],
          'fill-extrusion-base': [
            'interpolate',
            ['linear'],
            ['zoom'],
            15,
            0,
            15.05,
            ['get', 'min_height']
          ],
          'fill-extrusion-opacity': 0.6
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
          'line-color': '#02a2ff',
          'line-width': 8
        }
      });

      map.addLayer({
        'id': 'points',
        'type': 'symbol',
        'source': 'points',
        'layout': {
          'icon-image': 'custom-marker',
          // get the title name from the source's "title" property
          'text-field': ['get', 'title'],
          'text-font': [
            'Open Sans Semibold',
            'Arial Unicode MS Bold'
          ],
          'text-offset': [0, 0.5],
          'text-anchor': 'top'
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
