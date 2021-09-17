class utility {
  /*
  this class collects all needed tree and math methods
   */
  String error_1 = "operation not allowed on this node type";
  int[] primes =  {2, 3, 5, 7, 11, 13, 17, 19, 23, 
    29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 
    71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 
    113, 127, 131, 137, 139, 149, 151, 157, 163, 167, 
    173, 179, 181, 191, 193, 197, 199, 211, 223, 227, 
    229, 233, 239, 241, 251, 257, 263, 269, 271, 277, 
    281, 283, 293, 307, 311, 313, 317, 331, 337, 347, 
    349, 353, 359, 367, 373, 379, 383, 389, 397, 401, 
    409, 419, 421, 431, 433, 439, 443, 449, 457, 461, 
    463, 467, 479, 487, 491, 499, 503, 509, 521, 523, 
    541, 547, 557, 563, 569, 571, 577, 587, 593, 599, 
    601, 607, 613, 617, 619, 631, 641, 643, 647, 653, 
    659, 661, 673, 677, 683, 691, 701, 709, 719, 727, 
    733, 739, 743, 751, 757, 761, 769, 773, 787, 797, 
    809, 811, 821, 823, 827, 829, 839, 853, 857, 859, 
    863, 877, 881, 883, 887, 907, 911, 919, 929, 937, 
    941, 947, 953, 967, 971, 977, 983, 991, 997};

  utility() {
    IntList dec = primeDecomposition(319);
    int a = 6;
    int b = 20;
    int c = 4;
    int d = 10;
    int[] sum = fractionSum(a, b, c, d);
    println(a+"/"+b+" + "+c+"/"+d+" = " + sum[0] + "/" + sum[1]);
    int[] simplified = fractionSimplify(sum[0],sum[1]);
    println("simplified: "+simplified[0]+"/"+simplified[1]);
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
  /*  ################################ arithmetic utilities */

  IntList primeDecomposition(int n) {
    // returns an IntList of exponents
    // decomposition[i] is the exponent of the i-th prime number in the factorization of n
    IntList decomposition = new IntList();
    for (int i=0; i<primes.length; i++ ) {
      decomposition.append(0);
      int s = 0;
      while (n % primes[i] == 0) {
        s++;
        decomposition.set(i, s);
        n = n/primes[i];
      }
      if (n == 1) {
        i = primes.length;
      }
    }
    return decomposition;
  }

  int[] fractionSum(int a, int b, int c, int d) {
    // returns the fraction a/b + c/d
    int[] sumFraction = new int[2]; // numerator and denominator
    int lcm = lcm(b, d);
    sumFraction[0] = lcm/b*a + lcm/d*c;
    sumFraction[1] = lcm;
    return sumFraction;
  }

  int[] fractionSimplify(int a, int b) {
    int[] simplifiedFraction = new int[2];
    int gcd = gcd(a, b);
    simplifiedFraction[0] = a/gcd;
    simplifiedFraction[1] = b/gcd;
    return simplifiedFraction;
  }

  int lcm(int a, int b) {
    int lcm = 1;
    IntList dec_a = primeDecomposition(a);
    IntList dec_b = primeDecomposition(b);
    int la = dec_a.size();
    int lb = dec_b.size();
    if (la < lb) {
      // a has fewer factors than b
      for (int i=0; i<lb-la; i++) {
        dec_a.append(0);
      }
    } 
    if (la > lb) {
      // b has fewer factors than a
      for (int i=0; i<la-lb; i++) {
        dec_b.append(0);
      }
    }
    for (int k=0; k<dec_a.size(); k++) {
      lcm = lcm*int(pow(primes[k], max(dec_a.get(k), dec_b.get(k))));
    }
    return lcm;
  }

  int gcd(int a, int b) {
    int gcd = 1;
    IntList dec_a = primeDecomposition(a);
    IntList dec_b = primeDecomposition(b);
    int l = min(dec_a.size(), dec_b.size());
    for (int i=0; i<l; i++) {
      if (dec_a.get(i)*dec_b.get(i) != 0) {
        // found a common divisor
        gcd = gcd*int(pow(primes[i], min(dec_a.get(i), dec_b.get(i))));
      }
    }
    return gcd;
  }
}
