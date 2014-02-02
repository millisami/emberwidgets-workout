## Used for bundling files together using neuter

Ember.Widgets = Ember.Namespace.create()
Ember.Widgets.VERSION = '0.0.1'
Ember.libraries?.register 'Ember Widgets', Ember.Widgets.VERSION

require 'ember_widgets/mixins'
require 'ember_widgets/popover'
require 'ember_widgets/popover_link'
