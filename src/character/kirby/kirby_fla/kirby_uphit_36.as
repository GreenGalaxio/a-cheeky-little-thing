// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//kirby_fla.kirby_uphit_36

package kirby_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import flash.geom.*;
    import flash.display.*;
    import flash.events.*;
    import flash.utils.*;
    import flash.media.*;
    import flash.filters.*;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.desktop.*;
    import flash.errors.*;
    import flash.external.*;
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
    import flash.xml.*;

    public dynamic class kirby_uphit_36 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hatBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;
        public var xframe:String;

        public function kirby_uphit_36()
        {
            addFrameScript(0, this.frame1, 3, this.frame4, 8, this.frame9, 9, this.frame10, 14, this.frame15, 22, this.frame23, 23, this.frame24, 26, this.frame27, 31, this.frame32, 32, this.frame33, 37, this.frame38, 42, this.frame43, 45, this.frame46);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.xframe = null;
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                if (this.self.getCurrentKirbyPower() != null)
                {
                    gotoAndPlay("haspower");
                };
            };
        }

        internal function frame4():*
        {
            if (this.self.getCurrentKirbyPower() != null)
            {
                gotoAndPlay("chargingpower");
            };
            this.xframe = "charging";
        }

        internal function frame9():*
        {
            this.gotoAndPlay("charging");
        }

        internal function frame10():*
        {
            if (this.self.getCurrentKirbyPower() != null)
            {
                gotoAndPlay("powerattack");
            };
            this.xframe = "attack";
            this.self.playVoiceSound(1);
            this.self.playAttackSound(1);
        }

        internal function frame15():*
        {
            this.self.updateAttackBoxStats(1, {
                "damage":11,
                "power":10,
                "kbConstant":50
            });
        }

        internal function frame23():*
        {
            this.self.endAttack();
        }

        internal function frame24():*
        {
            this.xframe = null;
        }

        internal function frame27():*
        {
            this.xframe = "charging";
        }

        internal function frame32():*
        {
            this.gotoAndPlay("charging");
        }

        internal function frame33():*
        {
            this.xframe = "attack";
            SSF2API.playSound("kirby_attackstar");
        }

        internal function frame38():*
        {
            this.self.updateAttackBoxStats(1, {
                "damage":11,
                "power":10,
                "kbConstant":50
            });
        }

        internal function frame43():*
        {
            SSF2API.playSound("kirby_attackstar");
        }

        internal function frame46():*
        {
            this.self.endAttack();
        }


    }
}//package kirby_fla

