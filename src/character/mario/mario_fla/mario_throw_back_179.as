// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//mario_fla.mario_throw_back_179

package mario_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
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

    public dynamic class mario_throw_back_179 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var itemBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var touchBox:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var enemy:Object;

        public function mario_throw_back_179()
        {
            addFrameScript(0, this.frame1, 4, this.frame5, 6, this.frame7, 8, this.frame9, 10, this.frame11, 12, this.frame13, 15, this.frame16, 16, this.frame17, 18, this.frame19, 20, this.frame21, 22, this.frame23, 24, this.frame25, 26, this.frame27, 32, this.frame33);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (this.self)) && (SSF2API.isReady())))
            {
                this.enemy = this.self.getGrabbedOpponent();
                this.self.swapDepths(this.enemy);
            };
        }

        internal function frame5():*
        {
            SSF2API.playSound("mario_hoo");
            SSF2API.playSound("whoosh1");
        }

        internal function frame7():*
        {
            this.enemy.flip();
        }

        internal function frame9():*
        {
            this.self.swapDepths(this.enemy);
        }

        internal function frame11():*
        {
            this.enemy.flip();
        }

        internal function frame13():*
        {
            this.self.swapDepths(this.enemy);
        }

        internal function frame16():*
        {
            SSF2API.playSound("whoosh1");
        }

        internal function frame17():*
        {
            this.enemy.flip();
        }

        internal function frame19():*
        {
            this.self.swapDepths(this.enemy);
        }

        internal function frame21():*
        {
            this.enemy.flip();
        }

        internal function frame23():*
        {
            this.self.swapDepths(this.enemy);
        }

        internal function frame25():*
        {
            SSF2API.shakeCamera(9);
            this.enemy.flip();
        }

        internal function frame27():*
        {
            SSF2API.playSound("whoosh1");
            SSF2API.playSound("mario_ha");
        }

        internal function frame33():*
        {
            this.self.flip();
            this.self.endAttack();
        }


    }
}//package mario_fla

