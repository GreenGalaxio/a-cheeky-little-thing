// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//blackmage_fla.bmledgeattack_124

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

    public dynamic class bmledgeattack_124 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;

        public function bmledgeattack_124()
        {
            addFrameScript(0, this.frame1, 10, this.frame11, 11, this.frame12, 26, this.frame27, 27, this.frame28, 39, this.frame40, 48, this.frame49, 52, this.frame53, 54, this.frame55, 56, this.frame57, 76, this.frame77);
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
                if (this.self.getDamage() >= 100)
                {
                    this.gotoAndPlay("heavy");
                };
                this.self.setIntangibility(true);
            };
        }

        internal function frame11():*
        {
            this.self.setIntangibility(false);
        }

        internal function frame12():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame27():*
        {
            this.self.endAttack();
        }

        internal function frame28():*
        {
            this.self.setIntangibility(true);
        }

        internal function frame40():*
        {
            this.self.setXSpeed(5, false);
            this.self.setYSpeed(-10);
            this.self.setIntangibility(false);
        }

        internal function frame49():*
        {
            this.self.setXSpeed(0);
            this.self.setYSpeed(0);
            this.self.updateAttackStats({"air_ease":0});
        }

        internal function frame53():*
        {
            this.self.setXSpeed(0);
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.jumpToContinue);
        }

        internal function frame55():*
        {
            this.self.setYSpeed(5);
            this.self.updateAttackStats({"air_ease":-1});
        }

        internal function frame57():*
        {
            this.gotoAndPlay("loop");
        }

        internal function frame77():*
        {
            this.self.endAttack();
        }


    }
}//package blackmage_fla

