<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CatalogoPeliculas._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="col-md-4">
                    <div class="form-group">
                        <input type="text" id="txtbuscar" class="form-control" ng-model="PalabraClave" onkeypress="return Caracteres(event);"
                            onkeydown="checkKey(event)" placeholder="Ingrese palabra clave" />
                    </div>
                </div>
                <div class="col-md-2">
                    <button type="button" id="btnbuscar" value="Buscar" ng-click="Buscar();" class="btn btn-primary btn-block">
                        <span class="fa fa-search"></span>&nbsp;Buscar
                    </button>
                </div>
            </div>
        </div>
        <div class="row col-md-12">
            <div class="panel panel-default panel-header">
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div ng-if="ListaPeliculas.length" class="row col-md-12">
                    <div ng-repeat="x in ListaPeliculas" class="col-md-4">
                        <div class="panel panel-default" id="body-result">
                            <div class="panel-body">
                                <blockquote class="blockquote mb-0">
                                    <img src="{{x.Poster!='N/A' ? x.Poster : '../Content/Bootstrap/img/imgNotFound.png' }}" alt="" />
                                    <h4>{{x.Title}}</h4>
                                    <h6>Año: {{x.Year}} - Tipo: {{x.Type}}</h6>
                                    <button type="button" class="btn btn-default" value="Detalle" ng-click="Detalle(x);">
                                        <span class="glyphicon glyphicon-eye"></span>&nbsp;Detalle
                                    </button>
                                </blockquote>
                            </div>
                        </div>
                    </div>
                </div>
                <div ng-if="ListaPeliculas.length===0" class="row col-md-12">
                    <div class="alert alert-info">
                        <i>- Ingrese palabra clave por la cual desea realizar la consulta - </i>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal Procesando -->
    <div class="modal fade" id="modCargando" tabindex="-1" role="dialog" aria-labelledby="tituloModalCargando">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="tituloModalCargando">Procesando...</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="progress">
                                <div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%--  Modal Detalles de la pelicula --%>
    <div class="modal fade" id="ModalDetalles" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        ×
                    </button>
                    <h3 class="modal-title"><strong>{{DetallePeliculas.Title}}</strong>
                    </h3>
                </div>
                <div class="modal-body">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="col-md-4">
                                    <img src="{{DetallePeliculas.Poster!='N/A' ? DetallePeliculas.Poster : '../Content/Bootstrap/img/imgNotFound.png'}}" alt="" />
                                </div>
                                <div class="col-md-8">
                                    <div ng-if="DetallePeliculas.Type==='movie'">
                                        <table class="table table-hover table-bordered table-condensed">
                                            <tbody>
                                                <tr>
                                                    <td><strong>Actores: </strong><em>{{DetallePeliculas.Actors}}</em></td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Premios: </strong><em>{{DetallePeliculas.Awards}}</em></td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Taquillas: </strong><em>{{DetallePeliculas.BoxOffice}}</em></td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Pais: </strong><em>{{DetallePeliculas.Country}}</em></td>
                                                </tr>
                                                <tr>
                                                    <td><strong>DVD: </strong><em>{{DetallePeliculas.DVD}}</em></td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Director: </strong><em>{{DetallePeliculas.Director}}</em></td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Genero: </strong><em>{{DetallePeliculas.Genre}}</em></td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Idioma: </strong><em>{{DetallePeliculas.Language}}</em></td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Metascore: </strong><em>{{DetallePeliculas.Metascore}}</em></td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Trama: </strong><em>{{DetallePeliculas.Plot}}</em></td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Clasificación: </strong><em>{{DetallePeliculas.Rated}}</em></td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Produccion: </strong><em>{{DetallePeliculas.Production}}</em></td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Publicado: </strong><em>{{DetallePeliculas.Released}}</em></td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Duración: </strong><em>{{DetallePeliculas.Runtime}}</em></td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Tipo: </strong><em>{{DetallePeliculas.Type}}</em></td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Escritor: </strong><em>{{DetallePeliculas.Writer}}</em></td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Año: </strong><em>{{DetallePeliculas.Year}}</em></td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Calificación: </strong><em>{{DetallePeliculas.imdbRating}}</em></td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Votos: </strong><em>{{DetallePeliculas.imdbVotes}}</em></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div ng-if="DetallePeliculas.Type==='series'">
                                        <table class="table table-hover table-bordered table-condensed">
                                            <tbody>
                                                <tr>
                                                    <td><strong>Actores: </strong><em>{{DetallePeliculas.Actors}}</em></td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Premios: </strong><em>{{DetallePeliculas.Awards}}</em></td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Pais: </strong><em>{{DetallePeliculas.Country}}</em></td>
                                                </tr>
                                                <tr>
                                                    <td><strong>DVD: </strong><em>{{DetallePeliculas.DVD}}</em></td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Director: </strong><em>{{DetallePeliculas.Director}}</em></td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Genero: </strong><em>{{DetallePeliculas.Genre}}</em></td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Idioma: </strong><em>{{DetallePeliculas.Language}}</em></td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Metascore: </strong><em>{{DetallePeliculas.Metascore}}</em></td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Trama: </strong><em>{{DetallePeliculas.Plot}}</em></td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Clasificación: </strong><em>{{DetallePeliculas.Rated}}</em></td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Publicado: </strong><em>{{DetallePeliculas.Released}}</em></td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Duración: </strong><em>{{DetallePeliculas.Runtime}}</em></td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Tipo: </strong><em>{{DetallePeliculas.Type}}</em></td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Escritor: </strong><em>{{DetallePeliculas.Writer}}</em></td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Año: </strong><em>{{DetallePeliculas.Year}}</em></td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Calificación: </strong><em>{{DetallePeliculas.imdbRating}}</em></td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Votos: </strong><em>{{DetallePeliculas.imdbVotes}}</em></td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Temporadas: </strong><em>{{DetallePeliculas.totalSeasons}}</em></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div ng-if="DetallePeliculas.Type==='episode'">
                                        <table class="table table-hover table-bordered table-condensed">
                                            <tbody>
                                                <tr>
                                                    <td><strong>Actores: </strong><em>{{DetallePeliculas.Actors}}</em></td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Pais: </strong><em>{{DetallePeliculas.Country}}</em></td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Director: </strong><em>{{DetallePeliculas.Director}}</em></td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Genero: </strong><em>{{DetallePeliculas.Genre}}</em></td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Idioma: </strong><em>{{DetallePeliculas.Language}}</em></td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Temporada: </strong><em>{{DetallePeliculas.Season}}</em></td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Episodio: </strong><em>{{DetallePeliculas.Episode}}</em></td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Metascore: </strong><em>{{DetallePeliculas.Metascore}}</em></td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Trama: </strong><em>{{DetallePeliculas.Plot}}</em></td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Clasificación: </strong><em>{{DetallePeliculas.Rated}}</em></td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Publicado: </strong><em>{{DetallePeliculas.Released}}</em></td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Duración: </strong><em>{{DetallePeliculas.Runtime}}</em></td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Tipo: </strong><em>{{DetallePeliculas.Type}}</em></td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Escritor: </strong><em>{{DetallePeliculas.Writer}}</em></td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Año: </strong><em>{{DetallePeliculas.Year}}</em></td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Calificación: </strong><em>{{DetallePeliculas.imdbRating}}</em></td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Votos: </strong><em>{{DetallePeliculas.imdbVotes}}</em></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div ng-if="DetallePeliculas.Type!=='episode' && DetallePeliculas.Type!=='movie' && DetallePeliculas.Type!=='series'">
                                        <table class="table table-hover table-bordered table-condensed">
                                            <tbody>
                                                <tr>
                                                    <td><strong>Actores: </strong><em>{{DetallePeliculas.Actors}}</em></td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Pais: </strong><em>{{DetallePeliculas.Country}}</em></td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Director: </strong><em>{{DetallePeliculas.Director}}</em></td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Genero: </strong><em>{{DetallePeliculas.Genre}}</em></td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Idioma: </strong><em>{{DetallePeliculas.Language}}</em></td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Metascore: </strong><em>{{DetallePeliculas.Metascore}}</em></td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Trama: </strong><em>{{DetallePeliculas.Plot}}</em></td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Clasificación: </strong><em>{{DetallePeliculas.Rated}}</em></td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Publicado: </strong><em>{{DetallePeliculas.Released}}</em></td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Duración: </strong><em>{{DetallePeliculas.Runtime}}</em></td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Tipo: </strong><em>{{DetallePeliculas.Type}}</em></td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Escritor: </strong><em>{{DetallePeliculas.Writer}}</em></td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Año: </strong><em>{{DetallePeliculas.Year}}</em></td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Calificación: </strong><em>{{DetallePeliculas.imdbRating}}</em></td>
                                                </tr>
                                                <tr>
                                                    <td><strong>Votos: </strong><em>{{DetallePeliculas.imdbVotes}}</em></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
