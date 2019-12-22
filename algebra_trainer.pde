/*
algebraic formula generator
 a formula is a tree of operator nodes.
 Leaves of the tree are constants.
 Each formula is tagged by complexity and used properties (commutativity, distributivity etc)
 Basic properties come from the definition of a ring (algebra)
 */
utility U = new utility();

int W = 500;
int H = 500;

node root = new node(0);
int n_nodes = 0;

void setup() {
  root.ID = n_nodes;
  root.value = "x";
  root.printme(0);
  println(); 
  U.add_zero(root);
  root.printme(0);
  println(); 
  U.times_one(root.children.get(0));
  root.printme(0);
  println(); 
  
  
  size(500, 500);
}

void draw() {
  //formula.display();
}