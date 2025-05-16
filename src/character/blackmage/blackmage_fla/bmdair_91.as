// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//blackmage_fla.bmdair_91

package blackmage_fla
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

    public dynamic class bmdair_91 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var self:*;

        public function bmdair_91()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 3, this.frame4, 7, this.frame8, 16, this.frame17, 19, this.frame20, 20, this.frame21, 26, this.frame27);
        }

        public function jumpToContinue(_arg_1:Event=null):*
        {
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.jumpToContinue);
            gotoAndPlay("continue");
        }

        internal function frame1():*
        {
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
            };
            if (((parent) && (SSF2API.isReady())))
            {
                SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toLand);
                SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toIdle);
                this.self.setGlobalVariable("Boost", 0);
            };
        }

        internal function frame3():*
        {
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.jumpToContinue);
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toIdle);
        }

        internal function frame4():*
        {
            SSF2API.playSound("bm_scythe");
        }

        internal function frame8():*
        {
            this.self.fireProjectile("death");
        }

        internal function frame17():*
        {
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.jumpToContinue);
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toIdle);
        }

        internal function frame20():*
        {
            this.self.endAttack();
        }

        internal function frame21():*
        {
            this.self.updateAttackStats({
                "cancelWhenAirborne":true,
                "allowControl":false
            });
        }

        internal function frame27():*
        {
            this.self.endAttack();
        }


    }
}//package blackmage_fla

