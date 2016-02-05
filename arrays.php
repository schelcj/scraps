<pre>
  <?php
    $a = [[1,2], [3, 4], [5, 6]];

    print_r($a);

    $b = array_filter($a, function($k) {
      return $k[0];
    });

    print_r($b);

    function get_heights($i, $k) {
      return $i[0];
    }

    $c = array_walk($a, 'get_heights');

    print_r($c);

    $d = array();
    foreach ($a as $e) {
      array_push($d, $e[0]);
    }

    print_r($d);

    function sum($g) {
      return $g[0] + $g[1];
    }

    $f = array_map('sum', $a);

    print_r($f);

    $ret     = array();
    $mean    = array_sum($f) / count($f);
    $stddev  = stats_standard_deviation($f);
    $outlier = 3 * $stddev;

    print_r($mean);
  ?>
</pre>
