// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title CulturaGuineaBissau
 * @dev Registro de quimica de leguminosas costeras y estabilidad de lipidos rojos.
 * Serie: Sabores de Africa (48/54)
 */
contract CulturaGuineaBissau {

    struct Plato {
        string nombre;
        string ingredientes;
        string preparacion;
        uint256 densidadEmulsion;    // Nivel de concentracion de la mancarra (1-100)
        uint256 integracionMarina;   // Balance de sales y proteinas del mar (1-10)
        bool usaAceitePalmaRojo;     // Factor de carotenos y color
        uint256 likes;
        uint256 dislikes;
    }

    mapping(uint256 => Plato) public registroCulinario;
    uint256 public totalRegistros;
    address public owner;

    constructor() {
        owner = msg.sender;
        // Inauguramos con el Caldo de Mancarra (Ingenieria de la Emulsion Mixta)
        registrarPlato(
            "Caldo de Mancarra", 
            "Pasta de cacahuete (mancarra), pescado fresco o pollo, aceite de palma rojo, arroz.",
            "Disolucion de pasta de mancarra en caldo de pescado; estabilizacion lipidica con aceite de palma rojo.",
            92, 
            8, 
            true
        );
    }

    function registrarPlato(
        string memory _nombre, 
        string memory _ingredientes,
        string memory _preparacion,
        uint256 _densidad, 
        uint256 _marino,
        bool _palma
    ) public {
        require(bytes(_nombre).length > 0, "Nombre requerido");
        require(_densidad <= 100, "Escala de densidad excedida");

        totalRegistros++;
        registroCulinario[totalRegistros] = Plato({
            nombre: _nombre,
            ingredientes: _ingredientes,
            preparacion: _preparacion,
            densidadEmulsion: _densidad,
            integracionMarina: _marino,
            usaAceitePalmaRojo: _palma,
            likes: 0,
            dislikes: 0
        });
    }

    function darLike(uint256 _id) public {
        require(_id > 0 && _id <= totalRegistros, "ID invalido");
        registroCulinario[_id].likes++;
    }

    function darDislike(uint256 _id) public {
        require(_id > 0 && _id <= totalRegistros, "ID invalido");
        registroCulinario[_id].dislikes++;
    }
}
