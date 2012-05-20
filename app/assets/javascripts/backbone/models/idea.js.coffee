class Linus.Models.Idea extends Backbone.Model
  paramRoot: 'idea'

  defaults:
    headline: null

class Linus.Collections.IdeasCollection extends Backbone.Collection
  model: Linus.Models.Idea
  url: '/ideas'
  comparator: (idea) ->
    date = new Date(Date.parse(idea.get('created_at')))
    return date.getTime()
