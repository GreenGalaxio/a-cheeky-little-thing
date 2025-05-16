package com.mcleodgaming.ssf2.menus
{
   import com.mcleodgaming.ssf2.Main;
   import flash.events.MouseEvent;
   
   public class BlockedMenu extends Menu
   {
       
      
      public function BlockedMenu()
      {
         super();
         m_subMenu = Main.getLibraryMC("menu_blocked");
         m_container.addChild(m_subMenu);
         m_subMenu.x = Main.Width / 2;
         m_subMenu.y = Main.Height / 2;
      }
      
      override public function makeEvents() : void
      {
         if(m_showCount == 0)
         {
            findSubMenuButtons();
         }
         super.makeEvents();
         m_subMenu.mglink.addEventListener(MouseEvent.CLICK,this.callLink);
      }
      
      override public function killEvents() : void
      {
         super.killEvents();
         m_subMenu.mglink.removeEventListener(MouseEvent.CLICK,this.callLink);
      }
      
      private function callLink(param1:*) : void
      {
         var e:* = param1;
         var url:String = "http://www.mcleodgaming.com";
         try
         {
            Main.getURL(url,"_blank");
            return;
         }
         catch(e:Error)
         {
            trace("Error occurred calling MG URL!");
            return;
         }
      }
   }
}
