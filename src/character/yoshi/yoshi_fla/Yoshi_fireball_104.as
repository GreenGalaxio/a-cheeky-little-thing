// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//yoshi_fla.Yoshi_fireball_104

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

    public dynamic class Yoshi_fireball_104 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var character:*;

        public function Yoshi_fireball_104()
        {
            addFrameScript(0, this.frame1, 13, this.frame14);
        }

        public function hitsSomething(_arg_1:Event=null):*
        {
            this.self.attachEffect("fireball_hiteffect");
            this.self.destroy();
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.hitsSomething);
            SSF2API.removeEventListener(this.self, SSF2Event.HIT_WALL, this.hitsSomething);
            SSF2API.removeEventListener(this.self, SSF2Event.ATTACK_HIT, this.hitsSomething);
            SSF2API.removeEventListener(this.self, SSF2Event.ATTACK_HIT_SHIELD, this.hitsSomething);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getProjectile(this);
            if (((SSF2API.isReady()) && (this.self)))
            {
                this.character = SSF2API.getCharacter(this.self.getID());
                SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.hitsSomething);
                SSF2API.addEventListener(this.self, SSF2Event.ATTACK_HIT, this.hitsSomething);
                SSF2API.addEventListener(this.self, SSF2Event.ATTACK_HIT_SHIELD, this.hitsSomething);
                SSF2API.addEventListener(this.self, SSF2Event.HIT_WALL, this.hitsSomething);
            };
        }

        internal function frame14():*
        {
            gotoAndPlay("loop");
        }


    }
}//package yoshi_fla

