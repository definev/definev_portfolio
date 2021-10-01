'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "index.html": "6c6f2834238ef05bcefbd03aa82b2cb0",
"/": "6c6f2834238ef05bcefbd03aa82b2cb0",
"assets/NOTICES": "5d307f7c104f03412aa63c3395aed7b7",
"assets/assets/images/avatar.jpg": "5e369fa8adf17a8e5f278bdc45bae418",
"assets/assets/images/cat.gif": "0e70881ce2374bd838a25c30f5dc637e",
"assets/assets/locales/en-US.json": "bc0fd0baf44a41fa1e1ae92b4061a792",
"assets/assets/fonts/circular-std-medium.ttf": "9475d6a0b79c164f9f605673714e75d9",
"assets/assets/fonts/circular-std-regular.ttf": "7b6a17ecb64cdc5a99e571d35add218c",
"assets/packages/easy_localization/i18n/en.json": "5bd908341879a431441c8208ae30e4fd",
"assets/packages/easy_localization/i18n/ar-DZ.json": "acc0a8eebb2fcee312764600f7cc41ec",
"assets/packages/easy_localization/i18n/ar.json": "acc0a8eebb2fcee312764600f7cc41ec",
"assets/packages/easy_localization/i18n/en-US.json": "5bd908341879a431441c8208ae30e4fd",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/FontManifest.json": "3e8e7ba50964a0520bd6ebf4c73fbb56",
"assets/fonts/MaterialIcons-Regular.otf": "4e6447691c9509f7acdbf8a931a85ca1",
"assets/AssetManifest.json": "0e6dc98edeb631538560537beafaaa89",
"indicator/cat.gif": "0e70881ce2374bd838a25c30f5dc637e",
"version.json": "5f56205368c7b6b69e5a8ddb99db5824",
"manifest.json": "b6929bba415a311421ee0da6c459f5bc",
"icons/favicon-16x16.png": "3c5caae137857aef0184908267314526",
"icons/apple-icon-76x76.png": "277219ff62df0bbff8fcfe16f16a8f0c",
"icons/android-icon-36x36.png": "57f9c9779cccaa0c35507e7ddffd90ee",
"icons/apple-icon-114x114.png": "dd3bf3f4156fbb8b94c95c8134ddccb1",
"icons/apple-icon-144x144.png": "578f2bc7fa54e7fb034986d3373140aa",
"icons/apple-icon-57x57.png": "6e2f37245e612ccb3af30634788b1e03",
"icons/android-icon-192x192.png": "7fe5712821561e9489d01f656c8bbf17",
"icons/apple-icon.png": "acda7633780aff221a131d62251ba151",
"icons/apple-icon-precomposed.png": "acda7633780aff221a131d62251ba151",
"icons/android-icon-144x144.png": "578f2bc7fa54e7fb034986d3373140aa",
"icons/android-icon-72x72.png": "ba03a2c8e9b5d1437eb3045e5e4028bf",
"icons/ms-icon-70x70.png": "56796e5f9089e18e76db55d3f9778046",
"icons/manifest.json": "ccee3af8b2d18047fb77c30b84a224c6",
"icons/favicon.ico": "4dc8f951234aa1b05b3f535a908f753c",
"icons/android-icon-48x48.png": "7e720d839192a05f525a1df4dcf6068b",
"icons/favicon-32x32.png": "e4f2dca7c8c5e8aa8360598988bfa3ad",
"icons/apple-icon-60x60.png": "dbf30c4d8982c103337a664115c47fd5",
"icons/apple-icon-152x152.png": "601e851b22929785de609ae84a7b918c",
"icons/android-icon-96x96.png": "e7b7b7778efc6801e5f287dc0ad0e81c",
"icons/ms-icon-144x144.png": "578f2bc7fa54e7fb034986d3373140aa",
"icons/ms-icon-310x310.png": "e732fb0b4d9872ff7af8c27b4e836b58",
"icons/browserconfig.xml": "653d077300a12f09a69caeea7a8947f8",
"icons/favicon-96x96.png": "4570d9883f976fcd8a37634b8377a890",
"icons/apple-icon-72x72.png": "ba03a2c8e9b5d1437eb3045e5e4028bf",
"icons/ms-icon-150x150.png": "afc84514066045b4bfc9f060b354a906",
"icons/apple-icon-180x180.png": "d360547d7ccefb3c5e1172a9ce1b2414",
"icons/apple-icon-120x120.png": "87689f79c34b24e40485ce4502446e2c",
"main.dart.js": "6c8aee9c972e96e72f9a846b6677e125"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
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
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
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
