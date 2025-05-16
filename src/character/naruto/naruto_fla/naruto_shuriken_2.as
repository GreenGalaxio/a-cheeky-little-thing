// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//naruto_fla.naruto_shuriken_2

package naruto_fla
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

    public dynamic class naruto_shuriken_2 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var attackBox2:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var character:*;
        public var playsound:Number;
        public var audio:Number;

        public function naruto_shuriken_2()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 8, this.frame9, 9, this.frame10, 16, this.frame17, 26, this.frame27);
        }

        public function afterHit(_arg_1:Event=null):void
        {
            this.gotoAndPlay("afterHit");
            this.self.setXSpeed(0);
            this.self.setYSpeed(0);
            SSF2API.removeEventListener(this.self, SSF2Event.ATTACK_HIT, this.afterHit);
            SSF2API.removeEventListener(this.self, SSF2Event.ATTACK_HIT_SHIELD, this.afterHit);
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.toEnd);
            SSF2API.removeEventListener(this.self, SSF2Event.HIT_WALL, this.toEnd);
            this.self.updateProjectileStats({"maxgravity":0});
        }

        public function toEnd(_arg_1:Event=null):void
        {
            this.self.attachEffect("naruto_bunshindissappear");
            this.self.setXSpeed(0);
            this.self.setYSpeed(0);
            SSF2API.removeEventListener(this.self, SSF2Event.ATTACK_HIT, this.afterHit);
            SSF2API.removeEventListener(this.self, SSF2Event.ATTACK_HIT_SHIELD, this.afterHit);
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.toEnd);
            SSF2API.removeEventListener(this.self, SSF2Event.HIT_WALL, this.toEnd);
            this.self.updateProjectileStats({"maxgravity":0});
            this.self.destroy();
        }

        internal function frame1():*
        {
            this.self = SSF2API.getProjectile(this);
            if (((SSF2API.isReady()) && (this.self)))
            {
                this.character = SSF2API.getCharacter(this.self.getID());
                SSF2API.addEventListener(this.self, SSF2Event.ATTACK_HIT, this.afterHit);
                SSF2API.addEventListener(this.self, SSF2Event.ATTACK_HIT_SHIELD, this.afterHit);
                SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.toEnd);
                SSF2API.addEventListener(this.self, SSF2Event.HIT_WALL, this.toEnd);
            };
        }

        internal function frame2():*
        {
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.playsound = SSF2API.random();
                this.audio = this.character.getGlobalVariable("audio");
            };
        }

        internal function frame9():*
        {
            gotoAndPlay("toss");
        }

        internal function frame10():*
        {
            if ((((this.playsound > 0.2) && (this.playsound <= 0.4)) && (!(this.audio == 1))))
            {
                SSF2API.playSound("naruto_attack1");
                this.character.setGlobalVariable("audio", 1);
            };
            if ((((this.playsound > 0.4) && (this.playsound <= 0.6)) && (!(this.audio == 2))))
            {
                SSF2API.playSound("naruto_attack2");
                this.character.setGlobalVariable("audio", 2);
            };
            if ((((this.playsound > 0.6) && (this.playsound <= 0.8)) && (!(this.audio == 3))))
            {
                SSF2API.playSound("naruto_attack3");
                this.character.setGlobalVariable("audio", 3);
            };
            if ((((this.playsound > 0.8) && (this.playsound <= 1)) && (!(this.audio == 4))))
            {
                SSF2API.playSound("naruto_attack4");
                this.character.setGlobalVariable("audio", 4);
            };
        }

        internal function frame17():*
        {
            SSF2API.playSound("naruto_bunshin");
        }

        internal function frame27():*
        {
            this.self.destroy();
        }


    }
}//package naruto_fla

