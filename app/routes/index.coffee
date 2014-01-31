module.exports = App.IndexRoute = Ember.Route.extend(
  model: ->
    [
      title: "The Death and Life of Great American Cities"
      summary: "Jacobs' book is an attack on “orthodox” modern city planning and city architectural design. Looking into how cities actually work, rather than how they should work according to urban designers and planners, Jacobs effectively describes the real factors affecting cities, and recommends strategies to enhance actual city performance."
    ,
      title: "Down and Out in Paris and London"
      summary: "Down and Out in Paris and London (1933) is one of George Orwell’s first published works, an autobiographical account (or perhaps only a semiautobiographical account, depending on which reviewer/critic you read) of being destitute in Paris and London."
    ,
      title: "Nickel and Dimed: On (Not) Getting By in America"
      summary: "Barbara Ehrenreich’s non-fiction bestseller, Nickel and Dimed, is the story of an essay writer who went undercover as a low wage worker to find out how non-skilled workers make ends meet. The experiment took place in Florida, Maine, and Minnesota, with the author finding a job and lodgings in each location. The experiment was to be held for one month in each location, working full time and living only off the amount of money earned in low-wage jobs. The goal was to determine whether or not the author could both live off the money earned and have enough money at the end of the month to pay the next month’s rent."
     ]

  actions:
    openSummary: (book) ->
      @controllerFor("book").set "model", book
      @render "modals/book",
        into: "application"
        outlet: "modal"
        controller: "book"

    closeSummary: ->
      @disconnectOutlet
        outlet: "modal"
        parentView: "application"
)

App.BookController = Em.ObjectController.extend()

App.ModalViewMixin = Em.Mixin.create
  layoutName: "layouts/modal"
  onClose: Ember.computed(->
    "closeModal"
  )

  didInsertElement: ->
    Em.run.schedule "afterRender", this, ->
      controller = @get("controller")
      that = this
      @$(".modal").modal("show").one "hidden.bs.modal", ->
        if that.get("onClose") isnt null
          Em.run ->
            controller.send that.get("onClose")

  actions:
    hide: ->
      @$(".modal").modal "hide"

App.ModalsBookView = Em.View.extend App.ModalViewMixin,
  onClose: 'closeSummary'
