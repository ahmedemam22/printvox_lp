'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/assets/gif/logo_loading.gif": "fa00e4209832d4699065db24bce0d4dd",
"assets/assets/images/client_trust.png": "909912591449160bc7a84cfc6181e1b0",
"assets/assets/images/restaurant_bg.png": "38519eeb6424d3a52e897bf9846c3631",
"assets/assets/images/branding/mockup_10.png": "2dca4a31db41f73ce9b11b08c76bb3c9",
"assets/assets/images/branding/mockup_9.png": "c345f1c5e13ff077e543ec4dc872892e",
"assets/assets/images/branding/mockup_6.png": "208288e963172f1be8e6b370260914f1",
"assets/assets/images/branding/mockup_7.png": "26a0ff2c45b7e964266e391f7804f23d",
"assets/assets/images/branding/mockup_8.png": "accfe48126072c212e2665163b8648ef",
"assets/assets/images/printing/mockup_13.png": "4094362db436366e2d31b8352548a062",
"assets/assets/images/printing/mockup_12.png": "4d5cd8be26b460a814c245a89bfaa794",
"assets/assets/images/printing/mockup_14.png": "74ab2e0484dd817aa62862771fd09182",
"assets/assets/images/printing/mockup_11.png": "adaa2fabf4592c6550192c717d3b0720",
"assets/assets/images/printing/mockup_15.png": "9d5eab325ff2564ac4efcafd6815d797",
"assets/assets/images/cosmetics_bg.png": "31059da3ed1b0a895d3b268150934e8a",
"assets/assets/images/packaging/mockup_5.png": "95275ab1d1eaf6a71920377131efe212",
"assets/assets/images/packaging/mockup_3.png": "9894dc21fd5e9212786562b0074df080",
"assets/assets/images/packaging/mockup_1.png": "18dbdfa58a64e8fc3bb23f32e8dfd43e",
"assets/assets/images/packaging/mockup_2.png": "9deb70813eb9c6ff9f7a511b65141218",
"assets/assets/images/packaging/mockup_4.png": "11b5f3ef6d43a59b71ad35e779520eab",
"assets/assets/images/large_format/mockup_20.png": "c5832ccc261c116f50371cfe9eb6cf69",
"assets/assets/images/large_format/mockup_18.png": "25c0444a0e761b5aa9d0a8b3d500aafc",
"assets/assets/images/large_format/mockup_19.png": "afb23e02489e43da6a5d7a9f6ed9171a",
"assets/assets/images/large_format/mockup_17.png": "94e65e65c674bcf9d9c61d26d749e629",
"assets/assets/images/large_format/mockup_16.png": "ef41e600ba818256091c79ef1fa34cc1",
"assets/assets/images/school_bg.png": "7d497295326dd826ec614e1e85888970",
"assets/assets/images/bakery_bg.png": "c6bd5aca79932b8afcc6d4d82e826f63",
"assets/assets/images/factory_bg.png": "03749734084ff4723ef955a1398ccea0",
"assets/assets/images/header_mockup.png": "b4c0cb320faced403c6ee9e1162021c8",
"assets/assets/images/company_bg.png": "c8ebdf74a6a4868495c76bdbc54c7529",
"assets/assets/images/clothing_bg.png": "40ef9ce831f8050079b6f6e4af1645a1",
"assets/assets/icons/logo_char.png": "e6657fb9d6608c2b25e76253f676e545",
"assets/assets/icons/logo.png": "cf5d5e94f7c00a16da62572b2cff3414",
"assets/AssetManifest.json": "c92325bd8e91463c57cadd652834d05d",
"assets/AssetManifest.bin.json": "2284bdbf605d961400f1f23a45fb4a59",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/fonts/MaterialIcons-Regular.otf": "c070e5d9b26d6cdb507aaaf43dccea54",
"assets/AssetManifest.bin": "359f3d501cc09b9e30ede3c9f473f80b",
"assets/NOTICES": "46cd398a61f4ac145caf085a5fd0caac",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"manifest.json": "9292f1171ec2eefa21a1c0efa2b61c4d",
"index.html": "193100ca238cf18a843ea3ed19af22f9",
"/": "193100ca238cf18a843ea3ed19af22f9",
"canvaskit/skwasm.js.symbols": "0088242d10d7e7d6d2649d1fe1bda7c1",
"canvaskit/chromium/canvaskit.js.symbols": "193deaca1a1424049326d4a91ad1d88d",
"canvaskit/chromium/canvaskit.wasm": "24c77e750a7fa6d474198905249ff506",
"canvaskit/chromium/canvaskit.js": "5e27aae346eee469027c80af0751d53d",
"canvaskit/skwasm_heavy.js": "413f5b2b2d9345f37de148e2544f584f",
"canvaskit/canvaskit.js.symbols": "58832fbed59e00d2190aa295c4d70360",
"canvaskit/skwasm.wasm": "264db41426307cfc7fa44b95a7772109",
"canvaskit/canvaskit.wasm": "07b9f5853202304d3b0749d9306573cc",
"canvaskit/skwasm_heavy.js.symbols": "3c01ec03b5de6d62c34e17014d1decd3",
"canvaskit/canvaskit.js": "140ccb7d34d0a55065fbd422b843add6",
"canvaskit/skwasm_heavy.wasm": "8034ad26ba2485dab2fd49bdd786837b",
"canvaskit/skwasm.js": "1ef3ea3a0fec4569e5d531da25f34095",
"flutter.js": "888483df48293866f9f41d3d9274a779",
"flutter_bootstrap.js": "7debe2d572fc68cd94259a339f05b39f",
"main.dart.js": "4d88534532a1ea3daf0041da3c4f190a",
"version.json": "3dd3fd0e3e426d35abb7415445feb43a",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
