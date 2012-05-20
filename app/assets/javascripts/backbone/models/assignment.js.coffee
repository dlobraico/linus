class Linus.Models.Assignment extends Backbone.Model
  paramRoot: 'assignment'

  defaults:
    writer_id: null
    idea_id: null

class Linus.Collections.AssignmentsCollection extends Backbone.Collection
  model: Linus.Models.Assignment
  url: '/assignments'
