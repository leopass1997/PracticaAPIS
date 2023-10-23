Feature: Productos

  Scenario: Consulta de Producto por caracteristica especial
    * def product = { id: 11, title: "Silicon Power 256GB SSD 3D NAND A55 SLC Cache Performance Boost SATA III 2.5", category: "electronics", rating: { rate: 4.8 } }
    Given url "https://fakestoreapi.com/products"
    When method get
    Then status 200
    * match response == '#[20]'
    * match response contains deep product

  Scenario: Validar Catalogo de Productos
    Given url "https://fakestoreapi.com/products/category/electronics"
    When method get
    Then status 200
    And assert response.length == 6
    * match response contains deep { id: 11 }

