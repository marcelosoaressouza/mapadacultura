// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery.ui.datepicker
//= require jquery.ui.datepicker-pt-BR
//= require jquery_ujs
//= require fancybox
//= require twitter/bootstrap
//= require_tree .

// jQuery Functions
$(document).ready(function() {

  $('#popover-sobre').popover({ trigger: "hover" });
  $('#popover-login').popover({ trigger: "hover" });
  $('.popover-image').popover({ trigger: "hover" });
  $('#entidade-drop').popover({ trigger: "hover" });

  $('.jquery-ui-date').datepicker({
    showOn : 'button',
    buttonImageOnly : true,
    buttonImage : '/assets/calendar.png'
  });

  $('#estado').on('change', function() {
    $.getJSON('/estados/' + $(this).val() + '/cidades.json', function(data) {
      $('#cidade').empty();

      $.each(data, function(i, item) {
        $('#cidade').append('<option value="' + item.nome + '">' + item.nome + '</option>');
      });
    });
  });

/*
  $('#cep').on('change', function() {
    if (!$(this).val().match(/\d{8}/) && !$(this).val().match(/\d{5}-\d{3}/))
      return;

    $.getJSON('/cep/' + $(this).val() + '.json', function(data) {
      $('#logradouro').empty();
      $('#cidade').empty();
      $('#logradouro').val(data[0] + ' ' + data[1]);
      $('#estado').val(data[4]);
      $('#cidade').append('<option value="' + data[3].toUpperCase() + '">' + data[3].toUpperCase() + '</option>');
    });
  });
*/

  $('#Atividades').on('hidden', function() {
    $(':checkbox:checked').removeAttr('checked');
    Gmaps.map.clearMarkers(null);
  });

  $('#TipoEntidades').on('hidden', function() {
    $(':checkbox:checked').removeAttr('checked');
    Gmaps.map.clearMarkers(null);
  });

  $('#TipoEquipamentos').on('hidden', function() {
    $(':checkbox:checked').removeAttr('checked');
    Gmaps.map.clearMarkers(null);
  });

  $("#image-box").fancybox();

  $("#video-box").fancybox({
    'width'         : '400',
    'height'        : '250',
    'closeBtn'      : true,
    'autoScale'     : false,
    'transitionIn'  : 'none',
    'transitionOut' : 'none',
    'fitToView'     : false,
    'autoSize'      : false,
    'type'          : 'iframe'
  });
});

// Maps Functions

function uncheck() {
  $('.checkbox-atividade:checkbox:checked').removeAttr('checked');
}

function CarregarTipoEquipamentos(id) {
  if (document.getElementById(id).checked) {
    $.ajax({
      type : 'get',
      url : '/entidade_equipamentos/view/equipamento/' + id.match(/\d+$/)[0] + '.json',
      contentType : 'application/json; charset=utf-8',
      dataType : 'json',
      success : function(responseData) {
        Gmaps.map.addMarkers(responseData);
      }
    });
  } else {
    $.ajax({
      type : 'get',
      url : '/entidade_equipamentos/view/equipamento/' + id.match(/\d+$/)[0] + '.json',
      contentType : 'applications/json; charset=utf-8',
      dataType : 'json',
      success : function(responseData) {
        Gmaps.map.clearMarkers(responseData);

        c = document.getElementsByTagName('input');
        for (var i = 0; i < c.length; i++) {
          if (c[i].type == 'checkbox') {
            if (c[i].checked) {
              $.ajax({
                type : 'get',
                url : '/entidade_equipamentos/view/equipamento/' + (c[i].attributes["id"].value).match(/\d+$/)[0] + '.json',
                contentType : 'application/json; charset=utf-8',
                dataType : 'json',
                success : function(responseData) {
                  Gmaps.map.addMarkers(responseData);
                }
              });
            }
          }
        }
      }
    });
  }
}

function CarregarAtividades(id) {
  if (document.getElementById(id).checked) {
    $.ajax({
      type : 'get',
      url : '/entidade_equipamentos/view/atividade/' + id.match(/\d+$/)[0] + '.json',
      contentType : 'application/json; charset=utf-8',
      dataType : 'json',
      success : function(responseData) {
        Gmaps.map.addMarkers(responseData);
      }
    });
  } else {
    $.ajax({
      type : 'get',
      url : '/entidade_equipamentos/view/atividade/' + id.match(/\d+$/)[0] + '.json',
      contentType : 'application/json; charset=utf-8',
      dataType : 'json',
      success : function(responseData) {
        Gmaps.map.clearMarkers(responseData);

        c = document.getElementsByTagName('input');
        for (var i = 0; i < c.length; i++) {
          if (c[i].type == 'checkbox') {
            if (c[i].checked) {
              $.ajax({
                type : 'get',
                url : '/entidade_equipamentos/view/atividade/' + (c[i].attributes["id"].value).match(/\d+$/)[0] + '.json',
                contentType : 'application/json; charset=utf-8',
                dataType : 'json',
                success : function(responseData) {
                  Gmaps.map.addMarkers(responseData);
                }
              });
            }
          }
        }
      }
    });
  }
}

function CarregarTipoEntidades(id) {
  if (document.getElementById(id).checked) {
    $.ajax({
      type : 'get',
      url : '/entidade_equipamentos/view/entidade/' + id.match(/\d+$/)[0] + '.json',
      contentType : 'application/json; charset=utf-8',
      dataType : 'json',
      success : function(responseData) {
        Gmaps.map.addMarkers(responseData);
      }
    });
  } else {
    $.ajax({
      type : 'get',
      url : '/entidade_equipamentos/view/entidade/' + id.match(/\d+$/)[0] + '.json',
      contentType : 'application/json; charset=utf-8',
      dataType : 'json',
      success : function(responseData) {
        Gmaps.map.clearMarkers(responseData);

        c = document.getElementsByTagName('input');
        for (var i = 0; i < c.length; i++) {
          if (c[i].type == 'checkbox') {
            if (c[i].checked) {
              $.ajax({
                type : 'get',
                url : '/entidade_equipamentos/view/entidade/' + (c[i].attributes["id"].value).match(/\d+$/)[0] + '.json',
                contentType : 'application/json; charset=utf-8',
                dataType : 'json',
                success : function(responseData) {
                  Gmaps.map.addMarkers(responseData);
                }
              });
            }
          }
        }
      }
    });
  }
}

var mapHelper;
function initMapHelper() {
  var mapHelper = new OpenLayers.Map('mapHelper');
  var proj4326 = new OpenLayers.Projection("EPSG:4326");
  var projmerc = new OpenLayers.Projection("EPSG:900913");
  var layerOSM = new OpenLayers.Layer.OSM("Street mapHelper");

  mapHelper.addLayers([layerOSM]);
  mapHelper.setCenter(new OpenLayers.LonLat(document.getElementById("entidade_equipamento_longitude").value, document.getElementById("entidade_equipamento_latitude").value).transform( new OpenLayers.Projection("EPSG:4326"), mapHelper.getProjectionObject()), 10);

  if (!mapHelper.getCenter()) mapHelper.zoomToMaxExtent();
    mapHelper.events.register("mousemove", mapHelper, function(e) { 
    var position = this.events.getMousePosition(e);
    var lonlat = mapHelper.getLonLatFromPixel( this.events.getMousePosition(e) );
    var lonlatTransf = lonlat.transform(mapHelper.getProjectionObject(), proj4326);
  });

  var icon = new OpenLayers.Icon('/assets/red-marker.png');   
  var markerslayer = new OpenLayers.Layer.Markers( "Markers" );
  var lonLatInitial = new OpenLayers.LonLat(document.getElementById("entidade_equipamento_longitude").value, document.getElementById("entidade_equipamento_latitude").value).transform( new OpenLayers.Projection("EPSG:4326"), mapHelper.getProjectionObject());
  markerslayer.addMarker(new OpenLayers.Marker(lonLatInitial, icon));
  mapHelper.addLayer(markerslayer);

  mapHelper.events.register("click", mapHelper, function(e) {
    var position = this.events.getMousePosition(e);
    var lonlat = mapHelper.getLonLatFromPixel(position);
    var lonlatTransf = lonlat.transform(mapHelper.getProjectionObject(), proj4326);

    document.getElementById("entidade_equipamento_latitude").value = lonlatTransf.lat;
    document.getElementById("entidade_equipamento_longitude").value = lonlatTransf.lon;

    var lonlat = lonlatTransf.transform(proj4326, mapHelper.getProjectionObject());
    markerslayer.clearMarkers();
    markerslayer.addMarker(new OpenLayers.Marker(lonlat, icon));
    mapHelper.addLayer(markerslayer);
  });

}
