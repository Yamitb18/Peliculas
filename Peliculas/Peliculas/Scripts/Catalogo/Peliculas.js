var app = angular.module('app', ["ui.bootstrap"]).controller('ctr', ['$scope', '$filter', '$http', '$window', '$location',
    function ($scope, $filter, $http, $window, $location) {
                
        $scope.ListaPeliculas = [];
        $scope.DetallePeliculas = [];

        // metodo llamado por el boton buscar del formulario que obtiene el listado de peliculas que retorna el Api
        $scope.Buscar = function () {
            if ($scope.PalabraClave !== "" && $scope.PalabraClave !== undefined) {
                $http.post("Default.aspx/BuscarPalabra", { Palabra: $scope.PalabraClave }).then(
                    function (successResponse) {
                        if (JSON.parse(successResponse.data.d).Response == "True") {
                            $scope.ListaPeliculas = (JSON.parse(successResponse.data.d)).Search;                                    
                        }
                        else {
                            $scope.ListaPeliculas = [];
                            MostrarMsj((JSON.parse(successResponse.data.d)).Error);
                        }
                        
                    });
            }
            else {
                MostrarMsj("Debe ingresar una palabra clave para realizar la busqueda");
            }
        }

        // metodo llamado por el boton detalle (desde cada pelicula), donde obtiene los datos del id de la pelicua que retorna el Api
        $scope.Detalle = function (x) {
            $('#modCargando').modal({ backdrop: 'static', keyboard: false }); // Barra de progreso
            $http.post("Default.aspx/Detalle", { Identificador: x.imdbID}).then(
                function (successResponse) {
                    $scope.DetallePeliculas = (JSON.parse(successResponse.data.d));
                });
            $('#modCargando').modal('hide');
            AbrirModal('#ModalDetalles');        
        }
    }]);

document.oncontextmenu = function () { return false }

function checkKey(evt) {
    if (evt.ctrlKey || evt.shiftKey)
        MostrarMsj("Solo se permite ingresar letras, espacios y numeros");

}

function Caracteres(e) {
    var unicode = e.charCode ? e.charCode : e.keyCode
    if (unicode != 8) {
        if (!((unicode >= 48 && unicode <= 57) || (unicode >= 65 && unicode <= 90) || (unicode >= 97 && unicode <= 122) || (unicode== 32 ) )) {
            return false;
        }
    }
}

function MostrarMsj(Msj) {
    swal({
        title: "Atención!",
        text: Msj,
        type: "info",
        background: '#F7F6F6',
        allowOutsideClick: false,
        allowEscapeKey: false
    });
}