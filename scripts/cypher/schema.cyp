// User
CREATE INDEX ON :User(status);
CREATE INDEX ON :User(display_name);
CREATE INDEX ON :User(f_name);
CREATE INDEX ON :User(l_name);
CREATE INDEX ON :User(passwd);
// Create constraints, will also create indexes automatically
CREATE CONSTRAINT ON (user:User) ASSERT user.id IS UNIQUE;
CREATE CONSTRAINT ON (user:User) ASSERT user.username IS UNIQUE;
CREATE CONSTRAINT ON (user:User) ASSERT user.email IS UNIQUE;

// Avatar
CREATE CONSTRAINT ON (avatar:Avatar) ASSERT avatar.id IS UNIQUE;
CREATE CONSTRAINT ON (avatar:Avatar) ASSERT avatar.url IS UNIQUE;

// Place
CREATE INDEX ON :Place(city);
CREATE INDEX ON :Place(province_dn);
CREATE INDEX ON :Place(province_code);
CREATE INDEX ON :Place(zipcode);
CREATE CONSTRAINT ON (place:Place) ASSERT place.id IS UNIQUE;

// Country
CREATE CONSTRAINT ON (country:Country) ASSERT country.id IS UNIQUE;
CREATE CONSTRAINT ON (country:Country) ASSERT country.display_name IS UNIQUE;
CREATE CONSTRAINT ON (country:Country) ASSERT country.code IS UNIQUE;

// Contributor
CREATE INDEX ON :Contributor(status);
CREATE INDEX ON :Contributor(display_name);
CREATE INDEX ON :Contributor(needed_by_ts);
CREATE CONSTRAINT ON (contributor:Contributor) ASSERT contributor.id IS UNIQUE;

// Project
CREATE INDEX ON :Project(display_name);
CREATE INDEX ON :Project(status);
CREATE INDEX ON :Project(is_flagged);
CREATE INDEX ON :Project(created_ts);
CREATE INDEX ON :Project(deadline_ts);
CREATE CONSTRAINT ON (project:Project) ASSERT project.id IS UNIQUE;
CREATE CONSTRAINT ON (project:Project) ASSERT project.display_name IS UNIQUE;

// Organization
CREATE INDEX ON :Organization(type);
CREATE INDEX ON :Organization(display_name);
CREATE CONSTRAINT ON (organization:Organization) ASSERT organization.id IS UNIQUE;

// Category
CREATE CONSTRAINT ON (category:Category) ASSERT category.id IS UNIQUE;
CREATE CONSTRAINT ON (category:Category) ASSERT category.display_name IS UNIQUE;