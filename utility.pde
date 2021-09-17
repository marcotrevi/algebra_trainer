class utility {
  /*
  this class collects all needed tree and math methods
   */
  String error_1 = "operation not allowed on this node type";

  utility() {
  }

  node nodeSum(ArrayList<node> childNodes) {
    node N = new node(1); // +
    for (int i=0; i<childNodes.size(); i++) {
      N.children.add(childNodes.get(i));
    }
    return N;
  }

  node opp(node child) {
    node N = new node(3);
    N.children.add(child);
    child.parentType = 3;
    return N;
  }

  node sum(node N1, node N2) {
    node N = new node(1); // +
    N1.parentType = 1;
    N2.parentType = 1;
    N.children.add(N1);
    N.children.add(N2);
    return N;
  }

  node nodeProduct(ArrayList<node> childNodes) {
    node N = new node(2); // *
    for (int i=0; i<childNodes.size(); i++) {
      N.children.add(childNodes.get(i));
    }
    return N;
  }

  node prod(node N1, node N2) {
    node N = new node(2); // *
    N1.parentType = 2;
    N2.parentType = 2;
    N.children.add(N1);
    N.children.add(N2);
    return N;
  }

  String printFormula(node N) {
    String formula = "";
    switch(N.type) {
    case 0:
      // node is a constant
      formula = N.value;
      break;
    case 1:
      // node is a + operator
      if (N.parentType != 1 && N.parentType != -1) {
        // this is to avoid typing too many parentheses
        formula = formula + "(";
      }
      for (int i=0; i<N.children.size()-1; i++) {
        formula = formula + printFormula(N.children.get(i)) + "+";
      }
      if (N.parentType != 1 && N.parentType != -1) {
        formula = formula + printFormula(N.children.get(N.children.size()-1)) + ")";
      } else {
        formula = formula + printFormula(N.children.get(N.children.size()-1));
      }
      break;
    case 2:
      // node is a * operator
      for (int i=0; i<N.children.size()-1; i++) {
        formula = formula + printFormula(N.children.get(i)) + "*";
      }
      formula = formula + printFormula(N.children.get(N.children.size()-1));
      break;
    case 3:
      if (N.children.get(0).type == 0 || N.children.get(0).type == 2) {
        // only child is a constant OR is a product OR is the first in a sum: parentheses are not needed
        formula = formula + "(-" + printFormula(N.children.get(0)) + ")";
      } else {
        formula = formula + "(-(" + printFormula(N.children.get(0)) + "))";
      }
      break;
    case 5:
      if (N.children.get(0).type == 0 || N.children.get(0).type == 3) {
        // only child is a constant OR an opposite
        formula = printFormula(N.children.get(0)) +"^" + N.power;
      } else {
        formula = "("+ printFormula(N.children.get(0)) +")^" + N.power;
      }
    }
    return formula;
  } 

  void add_child(node N, int type, String value) {
    // adds a child to an existing node N
    node new_node = new node(type);
    n_nodes++;
    new_node.ID = n_nodes;
    if (type == 0) {
      // if node type is constant
      new_node.value = value;
    }
    N.children.add(new_node);
    N.formulaLength++;
  }

  String evaluate(node N) {
    // 
    String formula = "";
    return formula;
  }

  // formula-building methods based on algebraic properties
  void distribute(node N) {
  }

  void factor(node N) {
  }
  // ################################################ formula building methods
  /*
*/

  node sum(node[] nodes) {
    node N = new node(1);
    for (int i=0; i<nodes.length; i++) {
      N.children.add(nodes[i]);
    }
    return N;
  }

  node sqr(node child) {
    node N = new node(5);
    N.power = 2;
    N.children.add(child);
    return N;
  }

  node binomialSquareCompact(node N1, node N2) {
    // this method returns a node which is the squared sum of N1 and N2: (N1 + N2)^2
    node N = sqr((sum(N1, N2)));
    return N;
  }

  node binomialSquareExpanded(node N1, node N2) {
    // this method returns a node which is the squared sum of N1 and N2: N1^2 +2*N1*N2 + N2^2    
    node two = new node(0);
    two.value = "2";
    node N = sum(sum(sqr(N1), sqr(N2)), prod(two, prod(N1, N2)));
    return N;
  }

  void add_zero(node N) {
    /* substitutes a node N of type constant OR type + with a node of type + with two children:
     1) the original node N
     2) a new constant node with value 0
     */
    // check if node type is consistent:
    if (N.type == 0) {
      // node is a constant
      add_child(N, 0, N.value);
      add_child(N, 0, "0");
      // node updates from constant to operator
      N.type = 1;
      N.value = "+";
    } else if (N.type == 1) {
      // node is type +
      // just adding a constant child 
      add_child(N, 0, "0");
    } else {
      println(error_1);
    }
  }

  void times_one(node N) {
    /* substitutes a node N of type constant OR type * with a node of type * with two children:
     1) the original node N
     2) a new constant node with value 1
     */
    // check if node type is consistent:
    if (N.type == 0) {
      // node is a constant
      add_child(N, 0, N.value);
      add_child(N, 0, "1");
      // node updates from constant to operator
      N.type = 2;
      N.value = "*";
    } else if (N.type == 2) {
      // node is type * 
      // just adding a constant child 
      add_child(N, 0, "1");
    } else {
      println(error_1);
    }
  }

  int estimateComplexity(node N) {
    /* formula complexity is estimated by these parameters:
     - formula depth
     - formula length (number of nodes)
     - number type (integer vs fractions)
     - presence of variables
     - operator type
     */
    int complexity = 0;
    return complexity;
  }
}
