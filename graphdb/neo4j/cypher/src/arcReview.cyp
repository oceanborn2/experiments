// find all nodes in the database
match(n) return n

match(n) return n.relationships.name

// delete all the records and relationships
MATCH (a)
OPTIONAL MATCH (a)-[r]-()
DELETE a, r

// does not work because of constraints on relationships
//match(n) delete n


// create flow 69 and link to spof01
create (fl69: Flow{f:69, name:'flow69'})

create (spof1: Spof{sp:1, name:'spof01'})

match(fl: Flow{f:69}), (sp:Spof{sp:1})
create (fl)-[:SPOF{severity:3}]->(sp)

// query the spof using only the flow to check if the link is working
match(fl:Flow{f:69}), (sp:Spof)
where (fl)-[:SPOF]->(sp)
return fl, sp

// create a use case 124
create (uc124: UseCase{id:124, name:'UC01'}),
(s1: Step {s:1, descr: 'first step'}),
(s2: Step {s:2, descr: 'second step', flow: 69}),
(s3: Step {s:3, descr: 'third step'}),
(uc124)-[:STEP]->(s1),
(uc124)-[:STEP]->(s2),
(uc124)-[:STEP]->(s3)


// link step 24 to flow 69
match(s:Step{flow:69}), (fl:Flow{f:69})
create (s)-[:USES]->(fl)

// find all the relevant data in one query - up to step (increment 1)
match(uc:UseCase{id:124}),(s:Step)
where exists(s.flow) and s.flow <>''
and (uc)-[:STEP]->(s)
return uc, s


// find all the relevant data in one query - up to step (increment 2)
match(uc:UseCase{id:124}),(s:Step), (fl:Flow)
where exists(s.flow) and s.flow <>''
and (uc)-[:STEP]->(s)
and (s)-[:USES]->(fl)
return uc, s, fl

