// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//megaman_fla.mega_bhb_ground_115

package megaman_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import com.mcleodgaming.ssf2api.core.SSF2Event;
    import flash.display.*;
    import flash.events.*;
    import flash.media.*;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.desktop.*;
    import flash.errors.*;
    import flash.external.*;
    import flash.filters.*;
    import flash.geom.*;
    import flash.globalization.*;
    import flash.net.*;
    import flash.net.drm.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.sampler.*;
    import flash.sensors.*;
    import flash.system.*;
    import flash.text.*;
    import flash.text.ime.*;
    import flash.text.engine.*;
    import flash.ui.*;
    import flash.utils.*;
    import flash.xml.*;

    public dynamic class mega_bhb_ground_115 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var self:*;
        public var xframe:String;
        public var continuePlaying:Boolean;
        public var handled:Boolean;
        public var restart:Boolean;
        public var finished:Boolean;

        public function mega_bhb_ground_115()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 2, this.frame3, 3, this.frame4, 4, this.frame5, 5, this.frame6, 6, this.frame7, 7, this.frame8, 8, this.frame9, 9, this.frame10, 10, this.frame11, 11, this.frame12, 12, this.frame13, 13, this.frame14, 14, this.frame15, 15, this.frame16, 16, this.frame17, 17, this.frame18, 18, this.frame19, 19, this.frame20, 20, this.frame21, 21, this.frame22, 22, this.frame23, 23, this.frame24, 24, this.frame25, 25, this.frame26, 26, this.frame27, 27, this.frame28, 28, this.frame29, 29, this.frame30, 30, this.frame31, 31, this.frame32);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.xframe = null;
            this.xframe = "attack";
            this.continuePlaying = false;
            this.handled = true;
            this.restart = false;
            this.finished = false;
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.self.updateAttackStats({
                    "allowJump":false,
                    "linkFrames":false,
                    "cancelWhenAirborne":true
                });
            };
        }

        internal function frame2():*
        {
            this.xframe = "bhb2";
        }

        internal function frame3():*
        {
            this.xframe = "bhb3";
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toIdle);
            this.self.updateAttackStats({"allowControl":false});
        }

        internal function frame4():*
        {
            this.xframe = "bhb4";
        }

        internal function frame5():*
        {
            this.xframe = "bhb5";
            this.self.playAttackSound(2);
        }

        internal function frame6():*
        {
            this.xframe = "bhb6";
        }

        internal function frame7():*
        {
            this.xframe = "bhb7";
        }

        internal function frame8():*
        {
            this.xframe = "bhb8";
        }

        internal function frame9():*
        {
            this.xframe = "bhb9";
            this.self.fireProjectile("megaman_galaxyman", 0, -20);
        }

        internal function frame10():*
        {
            this.xframe = "bhb10";
        }

        internal function frame11():*
        {
            this.xframe = "bhb11";
        }

        internal function frame12():*
        {
            this.xframe = "bhb12";
        }

        internal function frame13():*
        {
            this.xframe = "bhb13";
        }

        internal function frame14():*
        {
            this.xframe = "bhb14";
        }

        internal function frame15():*
        {
            this.xframe = "bhb15";
        }

        internal function frame16():*
        {
            this.xframe = "bhb16";
        }

        internal function frame17():*
        {
            this.xframe = "bhb17";
        }

        internal function frame18():*
        {
            this.xframe = "bhb18";
        }

        internal function frame19():*
        {
            this.continuePlaying = false;
            this.handled = false;
        }

        internal function frame20():*
        {
            this.xframe = "bhb20";
            if (this.continuePlaying != true)
            {
                gotoAndPlay("ending");
            };
        }

        internal function frame21():*
        {
            this.xframe = "bhb21";
            if (this.continuePlaying != true)
            {
                gotoAndPlay("ending");
            };
        }

        internal function frame22():*
        {
            this.xframe = "bhb22";
            if (this.continuePlaying != true)
            {
                gotoAndPlay("ending");
            };
        }

        internal function frame23():*
        {
            this.xframe = "bhb23";
            if (this.continuePlaying != true)
            {
                gotoAndPlay("ending");
            };
        }

        internal function frame24():*
        {
            this.xframe = "bhb24";
            gotoAndPlay("hold");
        }

        internal function frame25():*
        {
            if (this.self.getCurrentProjectile() != null)
            {
                this.self.getCurrentProjectile().getStanceMC().gotoAndPlay("continue");
            };
        }

        internal function frame26():*
        {
            this.xframe = "bhb26";
        }

        internal function frame27():*
        {
            this.xframe = "bhb27";
        }

        internal function frame28():*
        {
            this.xframe = "bhb28";
        }

        internal function frame29():*
        {
            this.xframe = "bhb29";
        }

        internal function frame30():*
        {
            this.xframe = "bhb30";
        }

        internal function frame31():*
        {
            this.xframe = "bhb31";
        }

        internal function frame32():*
        {
            this.xframe = "bhb32";
            this.self.endAttack();
        }


    }
}//package megaman_fla

