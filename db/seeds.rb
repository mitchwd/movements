Person.create!([
  {first_name: "Jon", last_name: "Jacobs", school_identifier: "X4511"},
  {first_name: "Anna", last_name: "Jones", school_identifier: "X2341"},
  {first_name: "Michael", last_name: "Jones", school_identifier: "X2344"},
  {first_name: "Tess", last_name: "Jones", school_identifier: "X0098"},
  {first_name: "Will", last_name: "Robinson", school_identifier: "X9987"},
  {first_name: "John", last_name: "Smith", school_identifier: "X0012"},
  {first_name: "Jacob", last_name: "Smith", school_identifier: "X0124"}
])
Identifier.create!([
  {person_id: 1, code: "123"},
  {person_id: 1, code: "101"},
  {person_id: 2, code: "234"},
  {person_id: 3, code: "345"},
  {person_id: 4, code: "456"},
  {person_id: 5, code: "567"},
  {person_id: 6, code: "678"},
  {person_id: 7, code: "789"}
])
Location.create!([
  {name: "Theatre", capacity: 50},
  {name: "Art Studio", capacity: 10},
  {name: "Gym", capacity: 100},
  {name: "Chapel", capacity: 250}
])
