// Realm
package core

// A path represents a location inside the system and may be expressed as
// a list of path components (ie. names) with colon as separators.
// shortcut syntax may be defined
type NamedPath []string

type NamedObject struct {
	path        NamedPath // object parent path ie. location
	id          string    // unique identifier in the system (uuid-like)
	name        string    // object name
	description string    // object description
	keywords    []Keyword // all name objects are candidates for keyword usage
}

type Realm struct {
	NamedObject
	architectureBook map[string]ArchitectureBook
}

type Requirement struct {
	req NamedObject
}

type ArchitectureBook struct {
	book               NamedObject
	informationSystems map[string]InformationSystem
}

type InformationSystem struct {
	is NamedObject
}
