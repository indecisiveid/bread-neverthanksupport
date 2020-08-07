USING PERIODIC COMMIT 10000

// Country
LOAD CSV WITH HEADERS FROM "file:///country.csv" AS line FIELDTERMINATOR '|'
CREATE (:Country {
    id: line.id, code: line.code, display_name: line.display_name
    // created: timestamp(), updated: timestamp()
  }
);

// Place
LOAD CSV WITH HEADERS FROM "file:///place.csv" AS line FIELDTERMINATOR '|'
CREATE (:Place {
    id: line.id, city: line.city, province_dn: line.province_dn, province_code: line.province_code, 
    zipcode: line.zipcode 
  }
);

// create relationship: Place --> Country
LOAD CSV WITH HEADERS FROM "file:///place.csv" AS line FIELDTERMINATOR '|'
MATCH (place:Place {id: line.id})
MATCH (country:Country {id: line.country_id})
MERGE (place)-[:LOCATED_IN]->(country);

// Category
LOAD CSV WITH HEADERS FROM "file:///category.csv" AS line FIELDTERMINATOR '|'
CREATE (:Category {
    id: line.id, display_name: line.display_name, description: line.description
  }
);

// Contributor
LOAD CSV WITH HEADERS FROM "file:///contributor.csv" AS line FIELDTERMINATOR '|'
CREATE (:Contributor {
    id: line.id, display_name: line.display_name, description: line.description
  }
);