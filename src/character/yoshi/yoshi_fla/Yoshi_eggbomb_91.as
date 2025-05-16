// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//yoshi_fla.Yoshi_eggbomb_91

package yoshi_fla
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

    public dynamic class Yoshi_eggbomb_91 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var character:*;

        public function Yoshi_eggbomb_91()
        {
            addFrameScript(0, this.frame1, 9, this.frame10, 10, this.frame11, 11, this.frame12);
        }

        public function eggBreak(_arg_1:Event=null):*
        {
            gotoAndPlay("continue");
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.eggBreak);
            SSF2API.removeEventListener(this.self, SSF2Event.HIT_WALL, this.eggBreak);
            SSF2API.removeEventListener(this.self, SSF2Event.ATTACK_HIT, this.eggBreak);
            SSF2API.removeEventListener(this.self, SSF2Event.ATTACK_HIT_SHIELD, this.eggBreak);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getProjectile(this);
            if (((SSF2API.isReady()) && (this.self)))
            {
                this.character = SSF2API.getCharacter(this.self.getID());
                SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.eggBreak);
                SSF2API.addEventListener(this.self, SSF2Event.ATTACK_HIT, this.eggBreak);
                SSF2API.addEventListener(this.self, SSF2Event.ATTACK_HIT_SHIELD, this.eggBreak);
                SSF2API.addEventListener(this.self, SSF2Event.HIT_WALL, this.eggBreak);
                this.scaleX = 1.5;
                this.scaleY = 1.5;
                this.gotoAndPlay("loop");
            };
        }

        internal function frame10():*
        {
            this.gotoAndPlay("loop");
        }

        internal function frame11():*
        {
            this.character.shakeCamera(5);
            SSF2API.playSound("Yoshi_egg_hit");
        }

        internal function frame12():*
        {
            this.self.attachEffect("eggExplosion");
            this.self.destroy();
        }


    }
}//package yoshi_fla

