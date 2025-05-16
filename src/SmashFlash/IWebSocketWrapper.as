package
{
   public interface IWebSocketWrapper
   {
       
      
      function getOrigin() : String;
      
      function getCallerHost() : String;
      
      function log(param1:String) : void;
      
      function fatal(param1:String) : void;
      
      function error(param1:String) : void;
   }
}
