// Keyword
package core

// Enumeration of keyword relationships
type KeywordRel string

const (
	SEL KeywordRel = "Self"
	REL            = "Related"
	SYN            = "Synonym"
	ANT            = "Antonym"
	PAR            = "Parent"
)

type Keyword struct {
	name        string
	description string
	relations   map[KeywordRel]map[string]Keyword

	// set-up a new relationship with this keyword
	//	func newrel /*(self Keyword)*/(rel KeywordRel, kw Keyword) {

	//	}
}
