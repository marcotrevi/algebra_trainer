/*
algebraic formula generator
 a formula is a tree of operator nodes.
 Leaves of the tree are constants.
 Each formula is tagged by complexity and used properties (commutativity, distributivity etc)
 */
utility U = new utility();

int W = 500;
int H = 500;

node formula = new node();

void setup() {
  size(500, 500);
}

void draw() {
  formula.display();
}