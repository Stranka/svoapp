/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */
    // Wait for Cordova to load
    // 
    document.addEventListener("deviceready", onDeviceReady, false);

    // Cordova is loaded and it is now safe to make calls Cordova methods
    //
    function onDeviceReady() {
//      window.location="http://www.sv-olbendorf.at/mobiles/starting_point";
//        blinker();
        checkConnection_0212();
    }

    function checkConnection_0212() {
//      alert('0212');
    var networkState = navigator.connection.type;

    var states = {};
    states[Connection.UNKNOWN]  = 'Unknown connection';
    states[Connection.ETHERNET] = 'Ethernet connection';
    states[Connection.WIFI]     = 'WiFi connection';
    states[Connection.CELL_2G]  = 'Cell 2G connection';
    states[Connection.CELL_3G]  = 'Cell 3G connection';
    states[Connection.CELL_4G]  = 'Cell 4G connection';
    states[Connection.CELL]     = 'Cell generic connection';
    states[Connection.NONE]     = 'No network connection';
//          alert(networkState);
      if (networkState == Connection.NONE) {
        alert('Keine Internetverbindung');
        //window.location="local/index.html";
        } else {
        window.location="http://www.sv-olbendorf.at/mobiles/starting_point";
      }
    }
    function checkConnection_101() {
      alert('101');
      var networkState = navigator.network.connection.type;

      var states = {};
      states[Connection.UNKNOWN]    = 'Unknown connection';
      states[Connection.ETHERNET]    = 'Ethernet connection';
      states[Connection.WIFI]       = 'WiFi connection';
      states[Connection.CELL_2G]    = 'Cell 2G connection';
      states[Connection.CELL_3G]    = 'Cell 3G connection';
      states[Connection.CELL_4G]    = 'Cell 4G connection';
      states[Connection.NONE]       = 'No network connection';
      alert(networkState);
    	if (networkState == Connection.NONE) {
    	  alert('Keine Internetverbindung');
    	  //window.location="local/index.html";
       	} else {
    	  window.location="http://www.sv-olbendorf.at/mobiles/starting_point";
      }
    }


function blinker() {
    $('.blink_me').fadeOut(500);
    $('.blink_me').fadeIn(500);
}

setInterval(blinker, 1000);
