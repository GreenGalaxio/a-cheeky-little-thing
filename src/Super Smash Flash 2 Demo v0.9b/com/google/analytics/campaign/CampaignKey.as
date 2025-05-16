package com.google.analytics.campaign
{
   public class CampaignKey
   {
       
      
      public var UCMD:String = "utm_medium";
      
      public var UCID:String = "utm_id";
      
      public var UCTR:String = "utm_term";
      
      public var UCSR:String = "utm_source";
      
      public var UCNO:String = "utm_nooverride";
      
      public var UCCN:String = "utm_campaign";
      
      public var UGCLID:String = "gclid";
      
      public var UCCT:String = "utm_content";
      
      public function CampaignKey()
      {
         UCCN = "utm_campaign";
         UCCT = "utm_content";
         UCID = "utm_id";
         UCMD = "utm_medium";
         UCNO = "utm_nooverride";
         UCSR = "utm_source";
         UCTR = "utm_term";
         UGCLID = "gclid";
         super();
      }
   }
}
