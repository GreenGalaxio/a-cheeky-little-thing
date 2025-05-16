// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//com.mcleodgaming.ssf2api.core.SSF2API

package com.mcleodgaming.ssf2api.core
{
    import flash.display.MovieClip;

    public class SSF2API 
    {

        private static var m_api:*;
        public static const VERSION_MAJOR:int = 0;
        public static const VERSION_MINOR:int = 1;
        public static const VERSION_REVISION:int = 20;


        public static function init(_arg_1:*):Class
        {
            if (m_api)
            {
                return (SSF2API);
            };
            m_api = _arg_1;
            return (SSF2API);
        }

        public static function signal(_arg_1:int, _arg_2:Object=null):void
        {
            if (!isReady())
            {
                return;
            };
            m_api.signal(_arg_1, _arg_2);
        }

        public static function getObjectType(_arg_1:*):String
        {
            return (m_api.getObjectType(_arg_1));
        }

        public static function getAPIVersion():String
        {
            return ((((SSF2API.VERSION_MAJOR + ".") + SSF2API.VERSION_MINOR) + ".") + SSF2API.VERSION_REVISION);
        }

        public static function print(_arg_1:String):void
        {
            if (!isReady())
            {
                return;
            };
            m_api.print(_arg_1);
        }

        public static function getCharacter(_arg_1:*):*
        {
            if ((_arg_1 is MovieClip))
            {
                MovieClip(_arg_1).stop();
            };
            if (!isReady())
            {
                return (null);
            };
            return (m_api.getCharacter(_arg_1));
        }

        public static function getProjectile(_arg_1:*):*
        {
            if ((_arg_1 is MovieClip))
            {
                MovieClip(_arg_1).stop();
            };
            if (!isReady())
            {
                return (null);
            };
            return (m_api.getProjectile(_arg_1));
        }

        public static function getItem(_arg_1:*):*
        {
            if ((_arg_1 is MovieClip))
            {
                MovieClip(_arg_1).stop();
            };
            if (!isReady())
            {
                return (null);
            };
            return (m_api.getItem(_arg_1));
        }

        public static function getEnemy(_arg_1:*):*
        {
            if ((_arg_1 is MovieClip))
            {
                MovieClip(_arg_1).stop();
            };
            if (!isReady())
            {
                return (null);
            };
            return (m_api.getEnemy(_arg_1));
        }

        public static function getCamBounds():Object
        {
            if (!isReady())
            {
                return (null);
            };
            return (m_api.getCamBounds());
        }

        public static function getDeathBounds():Object
        {
            if (!isReady())
            {
                return (null);
            };
            return (m_api.getDeathBounds());
        }

        public static function lightFlash(_arg_1:Boolean=true):void
        {
            if (!isReady())
            {
                return;
            };
            m_api.lightFlash(_arg_1);
        }

        public static function addEventListener(_arg_1:*, _arg_2:String, _arg_3:Function, _arg_4:Object=null):void
        {
            if (!isReady())
            {
                return;
            };
            m_api.addEventListener(_arg_1, _arg_2, _arg_3, _arg_4);
        }

        public static function removeEventListener(_arg_1:*, _arg_2:String, _arg_3:Function):void
        {
            if (!isReady())
            {
                return;
            };
            m_api.removeEventListener(_arg_1, _arg_2, _arg_3);
        }

        public static function createTimer(_arg_1:*, _arg_2:int, _arg_3:int, _arg_4:Function, _arg_5:Object=null):void
        {
            if (!isReady())
            {
                return;
            };
            m_api.createTimer(_arg_1, _arg_2, _arg_3, _arg_4, _arg_5);
        }

        public static function destroyTimer(_arg_1:*, _arg_2:Function):void
        {
            if (!isReady())
            {
                return;
            };
            m_api.destroyTimer(_arg_1, _arg_2);
        }

        public static function playSound(_arg_1:String, _arg_2:Boolean=false):int
        {
            if (!isReady())
            {
                return (-1);
            };
            return (m_api.playSound(_arg_1, _arg_2));
        }

        public static function stopSound(_arg_1:int):void
        {
            if (!isReady())
            {
                return;
            };
            m_api.stopSound(_arg_1);
        }

        public static function shakeCamera(_arg_1:int):void
        {
            if (!isReady())
            {
                return;
            };
            m_api.shakeCamera(_arg_1);
        }

        public static function matchGo():void
        {
            if (!isReady())
            {
                return;
            };
            m_api.matchGo();
        }

        public static function matchGoComplete():void
        {
            if (!isReady())
            {
                return;
            };
            m_api.matchGoComplete();
        }

        public static function random():Number
        {
            if (!isReady())
            {
                return (0);
            };
            return (m_api.random());
        }

        public static function randomInteger(_arg_1:int, _arg_2:int):int
        {
            if (!isReady())
            {
                return (0);
            };
            return (m_api.randomInteger(_arg_1, _arg_2));
        }

        public static function fixBG():void
        {
            if (!isReady())
            {
                return;
            };
            m_api.fixBG();
        }

        public static function isReady():Boolean
        {
            return ((m_api) && (m_api.isReady()));
        }


        public function setCamStageFocus(_arg_1:int):void
        {
            if (!isReady())
            {
                return;
            };
            m_api.setStageFocus(_arg_1);
        }

        public function removeCamStageFocus():void
        {
            if (!isReady())
            {
                return;
            };
            m_api.removeStageFocus();
        }

        public function attachEffect(_arg_1:String, _arg_2:Object=null):MovieClip
        {
            if (!isReady())
            {
                return (null);
            };
            return (m_api.attachEffect(_arg_1, _arg_2));
        }

        public function attachEffectOverlay(_arg_1:String, _arg_2:Object=null):MovieClip
        {
            if (!isReady())
            {
                return (null);
            };
            return (m_api.attachEffectOverlay(_arg_1, _arg_2));
        }

        public function calculateChargeDamage(_arg_1:Object):Number
        {
            if (!isReady())
            {
                return (0);
            };
            return (m_api.calculateChargeDamage(_arg_1));
        }


    }
}//package com.mcleodgaming.ssf2api.core

