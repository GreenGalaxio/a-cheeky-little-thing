// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//marth_fla.marth_fair_2_133

package marth_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import com.mcleodgaming.ssf2api.core.SSF2Event;
    import flash.events.Event;
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

    public dynamic class marth_fair_2_133 extends MovieClip 
    {

        public var attackBox4:MovieClip;
        public var attackBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var hitBox:MovieClip;
        public var attackBox3:MovieClip;
        public var attackBox2:MovieClip;
        public var self:*;
        public var landingBool:Boolean;

        public function marth_fair_2_133()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 11, this.frame12, 14, this.frame15, 15, this.frame16, 19, this.frame20);
        }

        public function jumpToContinue(_arg_1:Event=null):*
        {
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.jumpToContinue);
            this.self.updateAttackStats({"allowControl":false});
            gotoAndPlay("continue");
        }

        public function landingLag(_arg_1:Boolean):void
        {
            if (_arg_1)
            {
                SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toIdle);
                SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.jumpToContinue);
            }
            else
            {
                SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.jumpToContinue);
                SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toIdle);
            };
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.landingBool = false;
            if (((SSF2API.isReady()) && (this.self)))
            {
                this.landingLag(true);
            };
        }

        internal function frame3():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame12():*
        {
            this.landingLag(false);
        }

        internal function frame15():*
        {
            this.self.endAttack();
        }

        internal function frame16():*
        {
            this.self.setGlobalVariable("sideBCheck", 0);
        }

        internal function frame20():*
        {
            this.self.endAttack();
        }


    }
}//package marth_fla

