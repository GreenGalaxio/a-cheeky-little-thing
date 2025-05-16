// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//goku_fla.goku_sspecialair_395

package goku_fla
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

    public dynamic class goku_sspecialair_395 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var hitBox6:MovieClip;
        public var hitBox7:MovieClip;
        public var self:*;
        public var continuePlaying:Boolean;
        public var handled:Boolean;
        public var restart:Boolean;

        public function goku_sspecialair_395()
        {
            addFrameScript(0, this.frame1, 3, this.frame4, 6, this.frame7, 7, this.frame8, 9, this.frame10, 12, this.frame13, 13, this.frame14, 24, this.frame25);
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
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.continuePlaying = false;
                this.handled = true;
                this.restart = false;
            };
            if (((SSF2API.isReady()) && (this.self)))
            {
                SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.jumpToContinue);
            };
        }

        internal function frame4():*
        {
            this.self.fireProjectile("goku_kiblast_air", 20);
            this.self.playAttackSound(1);
        }

        internal function frame7():*
        {
            this.continuePlaying = false;
            this.handled = false;
        }

        internal function frame8():*
        {
            if (this.continuePlaying != true)
            {
                this.self.endAttack();
            }
            else
            {
                if (this.continuePlaying)
                {
                    gotoAndPlay("attack2");
                };
            };
        }

        internal function frame10():*
        {
            this.self.fireProjectile("goku_kiblast_air");
            this.self.playAttackSound(2);
            this.self.setAttackEnabled(false, "b_forward_air");
        }

        internal function frame13():*
        {
            this.continuePlaying = false;
            this.handled = false;
        }

        internal function frame14():*
        {
            this.self.endAttack();
        }

        internal function frame25():*
        {
            this.self.endAttack();
        }


    }
}//package goku_fla

