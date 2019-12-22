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

node root = new node(2);
int n_nodes = 1;

void setup() {
  root.ID = n_nodes;
  U.times_one(root);
  
  root.printme(0);
  size(500, 500);
}

void draw() {
  //formula.display();
}