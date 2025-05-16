package socket.io.parser
{
   public class Decoder
   {
       
      
      public function Decoder()
      {
         super();
      }
      
      public function decode(param1:String) : Object
      {
         var _loc2_:Object = this.decodeString(param1);
         if(Parser.BINARY_EVENT == _loc2_.type || Parser.BINARY_ACK == _loc2_.type)
         {
            throw new Error("Decoder Does not support binary data");
         }
         return _loc2_;
      }
      
      public function decodeString(param1:String) : Object
      {
         var c:String = null;
         var p:Object = null;
         var i:int = 0;
         var jsonString:String = null;
         var str:String = param1;
         str = str.substr(1);
         p = {};
         i = 0;
         p.type = Number(str.charAt(0));
         if(Parser.BINARY_EVENT == p.type || Parser.BINARY_ACK == p.type)
         {
            p.attachments = "";
            while(str.charAt(++i) != "-")
            {
               p.attachments = p.attachments + str.charAt(i);
            }
            p.attachments = Number(p.attachments);
         }
         if("/" == str.charAt(i + 1))
         {
            p.nsp = "";
            while(++i)
            {
               c = str.charAt(i);
               if("," == c)
               {
                  break;
               }
               p.nsp = p.nsp + c;
               if(i + 1 == str.length)
               {
                  break;
               }
            }
         }
         else
         {
            p.nsp = "/";
         }
         var next:String = str.charAt(i + 1);
         if("" != next && !isNaN(Number(next)))
         {
            p.id = "";
            while(++i)
            {
               c = str.charAt(i);
               if(null == c || isNaN(Number(c)))
               {
                  i--;
                  break;
               }
               p.id = p.id + str.charAt(i);
               if(i + 1 == str.length)
               {
                  break;
               }
            }
            p.id = Number(p.id);
         }
         if(str.charAt(++i))
         {
            try
            {
               jsonString = str.substr(i);
               p.data = JSON.decode(jsonString);
            }
            catch(e:Error)
            {
               p.data = str.substr(i);
            }
         }
         return p;
      }
   }
}
