window.create_project =()->
  $('#project_modal').modal('show')
  $.get('/projects/new')