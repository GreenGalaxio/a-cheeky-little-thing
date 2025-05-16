package socket.io.parser
{
   public class Encoder
   {
       
      
      public function Encoder()
      {
         super();
      }
      
      public function encode(param1:*, param2:Function) : void
      {
         var _loc3_:String = null;
         trace("encoding packet ",param1);
         if(param1.type == null)
         {
            throw new Error("Incorrect object type");
         }
         if(Parser.BINARY_EVENT == param1.type || Parser.BINARY_ACK == param1.type)
         {
            throw new Error("Encoder Does not support binary data");
         }
         _loc3_ = this.encodeAsString(param1);
         param2([_loc3_]);
      }
      
      public function encodeAsString(param1:*) : String
      {
         var _loc2_:String = "4";
         var _loc3_:Boolean = false;
         _loc2_ = _loc2_ + param1.type;
         if(param1.nsp && "/" != param1.nsp)
         {
            _loc3_ = true;
            trace("nsp : " + _loc3_);
            _loc2_ = _loc2_ + param1.nsp;
            trace("obj.nsp : " + param1.nsp);
         }
         if(null != param1.id)
         {
            if(_loc3_)
            {
               _loc2_ = _loc2_ + ",";
               _loc3_ = false;
            }
            _loc2_ = _loc2_ + param1.id;
         }
         if(null != param1.data)
         {
            if(_loc3_)
            {
               _loc2_ = _loc2_ + ",";
            }
            _loc2_ = _loc2_ + JSON.encode(param1.data);
         }
         return _loc2_;
      }
   }
}
