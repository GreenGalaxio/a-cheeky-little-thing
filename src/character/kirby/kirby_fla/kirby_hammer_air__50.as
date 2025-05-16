// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//kirby_fla.kirby_hammer_air__50

package kirby_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import com.mcleodgaming.ssf2api.core.SSF2Event;
    import flash.events.Event;
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

    public dynamic class kirby_hammer_air__50 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hatBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var stance:MovieClip;
        public var self:*;
        public var landingBool:Boolean;

        public function kirby_hammer_air__50()
        {
            addFrameScript(0, this.frame1, 3, this.frame4, 5, this.frame6, 15, this.frame16, 25, this.frame26, 33, this.frame34, 34, this.frame35, 37, this.frame38, 48, this.frame49, 57, this.frame58, 59, this.frame60);
        }

        public function jumpToContinue(_arg_1:Event=null):*
        {
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.jumpToContinue);
            this.self.updateAttackStats({"allowControl":false});
            gotoAndPlay("continue");
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.landingBool = false;
            if (((this.self) && (SSF2API.isReady())))
            {
                SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.jumpToContinue);
                if (this.self.getCurrentKirbyPower() != null)
                {
                    gotoAndPlay("haspower");
                };
            };
        }

        internal function frame4():*
        {
            this.self.playVoiceSound(1);
        }

        internal function frame6():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame16():*
        {
            this.self.playAttackSound(1);
            this.self.updateAttackBoxStats(1, {"damage":15});
            this.self.refreshAttackID();
        }

        internal function frame26():*
        {
            this.self.endAttack();
        }

        internal function frame34():*
        {
            this.self.endAttack();
        }

        internal function frame35():*
        {
            SSF2API.playSound("kirby_attackstar");
        }

        internal function frame38():*
        {
            this.self.playVoiceSound(1);
            this.self.playAttackSound(1);
        }

        internal function frame49():*
        {
            this.self.playAttackSound(1);
            this.self.updateAttackBoxStats(1, {"damage":15});
            this.self.refreshAttackID();
        }

        internal function frame58():*
        {
            SSF2API.playSound("kirby_attackstar");
        }

        internal function frame60():*
        {
            this.self.endAttack();
        }


    }
}//package kirby_fla

