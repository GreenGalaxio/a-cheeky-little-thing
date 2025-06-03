package com.jimisaacs.data
{
   import com.jimisaacs.utils.QueryParameters;
   
   public class URL
   {
       
      
      private var _protocol:String;
      
      private var _hostname:String;
      
      private var _port:String;
      
      private var _pathname:String;
      
      private var _search:QueryParameters;
      
      private var _hash:String;
      
      public function URL(param1:String = "")
      {
         super();
         this.parse(param1);
      }
      
      public function parse(param1:String) : void
      {
         if(param1.indexOf("//") == -1)
         {
            param1 = "http://" + param1;
         }
         var _loc2_:Array = param1.split("//");
         this._protocol = _loc2_.shift().split(":")[0];
         _loc2_ = _loc2_[0].split("/");
         this.host = _loc2_.shift();
         var _loc3_:String = _loc2_.join("/");
         if(_loc3_.indexOf("?") >= 0)
         {
            if(_loc3_.indexOf("#") >= 0)
            {
               if(_loc3_.indexOf("?") < _loc3_.indexOf("#"))
               {
                  this._pathname = _loc3_.substring(0,_loc3_.indexOf("?"));
                  this._search = new QueryParameters(_loc3_.substring(_loc3_.indexOf("?") + 1,_loc3_.indexOf("#")));
                  this._hash = _loc3_.substring(_loc3_.indexOf("#") + 1,_loc3_.length);
               }
               else
               {
                  this._pathname = _loc3_.substring(0,_loc3_.indexOf("#"));
                  this._search = new QueryParameters(_loc3_.substring(_loc3_.indexOf("#") + 1,_loc3_.length).replace("?",""));
                  this._hash = "";
               }
            }
            else
            {
               this._pathname = _loc3_.substring(0,_loc3_.indexOf("?"));
               this._search = new QueryParameters(_loc3_.substring(_loc3_.indexOf("?") + 1,_loc3_.length));
               this._hash = "";
            }
         }
         else if(_loc3_.indexOf("#") >= 0)
         {
            this._pathname = _loc3_.substring(0,_loc3_.indexOf("#"));
            this._search = new QueryParameters();
            this._hash = _loc3_.substring(_loc3_.indexOf("#") + 1,_loc3_.length);
         }
         else
         {
            this._pathname = _loc3_.substring(0,_loc3_.length);
            this._search = new QueryParameters();
            this._hash = "";
         }
      }
      
      public function get href() : String
      {
         var _loc1_:String = this.protocol + "//" + this.host;
         if(this.pathname != "")
         {
            _loc1_ = _loc1_ + ("/" + this.pathname);
         }
         if(this.search != "")
         {
            _loc1_ = _loc1_ + ("?" + this.search);
         }
         if(this.hash != "")
         {
            _loc1_ = _loc1_ + ("#" + this.hash);
         }
         return _loc1_;
      }
      
      public function set href(param1:String) : void
      {
         this.parse(param1);
      }
      
      public function get protocol() : String
      {
         return this._protocol;
      }
      
      public function set protocol(param1:String) : void
      {
         this._protocol = param1;
      }
      
      public function get host() : String
      {
         var _loc1_:String = this._hostname;
         if(this._port != "")
         {
            _loc1_ = _loc1_ + (":" + this._port);
         }
         return _loc1_;
      }
      
      public function set host(param1:String) : void
      {
         if(param1.indexOf(":") >= 0)
         {
            this._hostname = param1.substring(0,param1.indexOf(":"));
            this._port = param1.substring(param1.indexOf(":") + 1,param1.length);
         }
         else
         {
            this._hostname = param1;
            this._port = "";
         }
      }
      
      public function get hostname() : String
      {
         return this._hostname;
      }
      
      public function set hostname(param1:String) : void
      {
         this._hostname = param1;
      }
      
      public function get port() : String
      {
         return this._port;
      }
      
      public function set port(param1:String) : void
      {
         this._port = param1;
      }
      
      public function get pathname() : String
      {
         return this._pathname;
      }
      
      public function set pathname(param1:String) : void
      {
         this._pathname = param1;
      }
      
      public function get search() : String
      {
         return this._search.queryString;
      }
      
      public function set search(param1:String) : void
      {
         this._search.queryString = param1.replace("?","");
      }
      
      public function get parameters() : QueryParameters
      {
         return this._search;
      }
      
      public function set parameters(param1:*) : void
      {
         this._search.add(param1);
      }
      
      public function get hash() : String
      {
         return this._hash;
      }
      
      public function set hash(param1:String) : void
      {
         this._hash = param1.replace("#","");
      }
      
      public function valueOf() : Object
      {
         return this.href;
      }
      
      public function toString() : String
      {
         return this.href;
      }
   }
}
