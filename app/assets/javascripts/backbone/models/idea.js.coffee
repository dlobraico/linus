class Linus.Models.Idea extends Backbone.Model
  paramRoot: 'idea'

  defaults:
    headline: null

class Linus.Collections.IdeasCollection extends Backbone.Collection
  model: Linus.Models.Idea
  url: '/ideas'
