// Output format: CSV with 60 second timeout
[out:csv(::id, name)][timeout:60];

// Define search area using an OSM relation ID
// Find relation IDs at https://nominatim.openstreetmap.org
// California: https://www.openstreetmap.org/relation/165475
rel(165475);
map_to_area->.searchArea;

// Query: all route relations in California - these appear to
// come back sorted by ID, which means Git diffs should work
// decently well. New items should be at the end (except when
// an existing relation is extended to include items in the
// state, and deleted ones will be removed in the middle relatively cleanly.
(
  relation["type"="route"](area.searchArea);
);

// Output just the CSV - skip coords, members, etc.
out body;
