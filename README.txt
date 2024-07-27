Sobre o proxecto
================
Este é un RPG de exemplo utilizado como acompañamento da miña charla de Xullo en Godoteiras.

Trato con esta charla e o proxecto de mostrar unha posible arquitectura para un RPG que utilice boas prácticas de programación orientada a obxectos, tomando como punto de partida a documentación de Godot
https://docs.godotengine.org/en/stable/tutorials/best_practices/index.html

Controis
========

WASD para mover e barra de espazo para interactuar. Polo momento pódese interactuar cun par de computadoras ou co npc verde da sala contigua.

Para crear un novo elemento interactivo
=======================================

Para crear un novo elemento co que o personaxe poida interactuar, será preciso primeiro crear un nodo "DialogInteractor". A este nodo asignaráselle unha "CollisionShape3D" para definir a area de influenza e un "InteractionScript" para definir que pasará cando o xogador comece a interacción.

Unha vez creado o "InteractionScript", para definir cómo se comportará este novo elemento, o primeiro paso será, clickando co botón dereito sobre o nodo seleccionar "Extend script...". Isto abrirá un diálogo que permitirá crear un script herdado tomando como base "empty_interaction.gd".

Finalmente, na función "_start_interaction(gui:DialogUi)" poderase definir a interacción. Pódese tomar como exemplo a do elemento "main/npc_1/InteractionScript"

Licenza
=======
Toda o código é meu, con licenza GPLv3.0 ou posterior

A arte en 3D é de www.kenney.nl, con licenza CC0 e os sprites 2D de Calciumtrice con lic  CC-BY 3.0
