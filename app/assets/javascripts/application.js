// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require turbolinks
//= require_tree .
//= require cocoon
//= require algoliasearch.min
//= require algolia/typeahead.jquery
//= require hogan.js

// Algolia Search
$(document).ready(function() {
  var client = algoliasearch('BG9DXFQRB4', 'e302b47f7cceb032b5010b0045aca068');
  var locations = client.initIndex('Location');
  var persons = client.initIndex('Person');
  var identifiers = client.initIndex('Identifier');

  // Mustache templating by Hogan.js (http://mustache.github.io/)
  var templatePerson = Hogan.compile(
    '<div class="person">' +
      '<a href="/people/{{{ objectID }}}">' +
        '<div class="fullname">{{{ _highlightResult.fullname.value }}} <small>({{ location_name }})</small></div>' +
        '<div class="location">{{{ _highlightResult.location_name.value }}}</div>' +
      '</a>' +
    '</div>');
  var templateLocation = Hogan.compile(
    '<div class="location">' +
      '<a href="/locations/{{{ objectID }}}">' +
        '<div class="name">{{{ _highlightResult.name.value }}}</div>' +
      '</a>' +
    '</div>');
  var templateIdentifier = Hogan.compile(
    '<div class="identifier">' +
      '<a href="/identifiers/{{{ objectID }}}">' +
        '<div class="person">{{{ person_name }}} <small>({{{ _highlightResult.code.value }}})</small> </div>' +
      '</a>' +
    '</div>');

  // typeahead.js initialization
  $('#person-search').typeahead({hint: true}, [{
      source: locations.ttAdapter({hitsPerPage: 5}),
      displayKey: 'fullname',
      templates: {
        header: '<div class="category">Locations</div>',
        suggestion: function(hit) {
          return templateLocation.render(hit);
        }
      }
    }, {
      source: persons.ttAdapter({hitsPerPage: 5}),
      displayKey: 'fullname',
      templates: {
        header: '<div class="category">People</div>',
        suggestion: function(hit) {
          return templatePerson.render(hit);
        }
      }
    }, {
      source: identifiers.ttAdapter({hitsPerPage: 5}),
      displayKey: 'code',
      templates: {
        header: '<div class="category">Identifiers</div>',
        suggestion: function(hit) {
          return templateIdentifier.render(hit);
        }
      }
    }
  ]);
});
