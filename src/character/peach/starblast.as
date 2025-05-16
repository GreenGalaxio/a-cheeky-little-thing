// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//starblast

package 
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

    public dynamic class starblast extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var range:MovieClip;
        public var self:*;
        public var character:*;

        public function starblast()
        {
            addFrameScript(0, this.frame1, 37, this.frame38, 39, this.frame40, 63, this.frame64, 65, this.frame66, 89, this.frame90, 91, this.frame92, 115, this.frame116, 117, this.frame118, 141, this.frame142, 143, this.frame144, 167, this.frame168, 169, this.frame170, 193, this.frame194, 195, this.frame196, 219, this.frame220, 221, this.frame222, 245, this.frame246, 247, this.frame248, 270, this.frame271, 280, this.frame281, 281, this.frame282);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getProjectile(this);
            if (((SSF2API.isReady()) && (this.self)))
            {
                this.character = SSF2API.getCharacter(this.self.getID());
            };
        }

        internal function frame38():*
        {
            this.self.refreshAttackID();
            this.self.modifyKBConstant(25);
            this.self.modifyRefreshRate(50);
            this.self.modifyHitStun(1);
            this.self.modifyHitLag(0);
            this.self.modifyAttackPower(1300);
        }

        internal function frame40():*
        {
            this.self.refreshAttackID();
            this.self.modifyKBConstant(1);
            this.self.modifyRefreshRate(3);
            this.self.modifyHitStun(5);
            this.self.modifyHitLag(0.95);
            this.self.modifyAttackPower(900);
        }

        internal function frame64():*
        {
            this.self.refreshAttackID();
            this.self.modifyKBConstant(25);
            this.self.modifyRefreshRate(50);
            this.self.modifyHitStun(1);
            this.self.modifyHitLag(0);
            this.self.modifyAttackPower(1300);
        }

        internal function frame66():*
        {
            this.self.refreshAttackID();
            this.self.modifyKBConstant(1);
            this.self.modifyRefreshRate(3);
            this.self.modifyHitStun(5);
            this.self.modifyHitLag(0.95);
            this.self.modifyAttackPower(900);
        }

        internal function frame90():*
        {
            this.self.refreshAttackID();
            this.self.modifyKBConstant(25);
            this.self.modifyRefreshRate(50);
            this.self.modifyHitStun(1);
            this.self.modifyHitLag(0);
            this.self.modifyAttackPower(1300);
        }

        internal function frame92():*
        {
            this.self.refreshAttackID();
            this.self.modifyKBConstant(1);
            this.self.modifyRefreshRate(3);
            this.self.modifyHitStun(5);
            this.self.modifyHitLag(0.95);
            this.self.modifyAttackPower(900);
        }

        internal function frame116():*
        {
            this.self.refreshAttackID();
            this.self.modifyKBConstant(25);
            this.self.modifyRefreshRate(50);
            this.self.modifyHitStun(1);
            this.self.modifyHitLag(0);
            this.self.modifyAttackPower(1300);
        }

        internal function frame118():*
        {
            this.self.refreshAttackID();
            this.self.modifyKBConstant(1);
            this.self.modifyRefreshRate(3);
            this.self.modifyHitStun(5);
            this.self.modifyHitLag(0.95);
            this.self.modifyAttackPower(900);
        }

        internal function frame142():*
        {
            this.self.refreshAttackID();
            this.self.modifyKBConstant(25);
            this.self.modifyRefreshRate(50);
            this.self.modifyHitStun(1);
            this.self.modifyHitLag(0);
            this.self.modifyAttackPower(1300);
        }

        internal function frame144():*
        {
            this.self.refreshAttackID();
            this.self.modifyKBConstant(1);
            this.self.modifyRefreshRate(3);
            this.self.modifyHitStun(5);
            this.self.modifyHitLag(0.95);
            this.self.modifyAttackPower(900);
        }

        internal function frame168():*
        {
            this.self.refreshAttackID();
            this.self.modifyKBConstant(25);
            this.self.modifyRefreshRate(50);
            this.self.modifyHitStun(1);
            this.self.modifyHitLag(0);
            this.self.modifyAttackPower(1300);
        }

        internal function frame170():*
        {
            this.self.refreshAttackID();
            this.self.modifyKBConstant(1);
            this.self.modifyRefreshRate(3);
            this.self.modifyHitStun(5);
            this.self.modifyHitLag(0.95);
            this.self.modifyAttackPower(900);
        }

        internal function frame194():*
        {
            this.self.refreshAttackID();
            this.self.modifyKBConstant(25);
            this.self.modifyRefreshRate(50);
            this.self.modifyHitStun(1);
            this.self.modifyHitLag(0);
            this.self.modifyAttackPower(1300);
        }

        internal function frame196():*
        {
            this.self.refreshAttackID();
            this.self.modifyKBConstant(1);
            this.self.modifyRefreshRate(3);
            this.self.modifyHitStun(5);
            this.self.modifyHitLag(0.95);
            this.self.modifyAttackPower(900);
        }

        internal function frame220():*
        {
            this.self.refreshAttackID();
            this.self.modifyKBConstant(25);
            this.self.modifyRefreshRate(50);
            this.self.modifyHitStun(1);
            this.self.modifyHitLag(0);
            this.self.modifyAttackPower(1300);
        }

        internal function frame222():*
        {
            this.self.refreshAttackID();
            this.self.modifyKBConstant(1);
            this.self.modifyRefreshRate(3);
            this.self.modifyHitStun(5);
            this.self.modifyHitLag(0.95);
            this.self.modifyAttackPower(900);
        }

        internal function frame246():*
        {
            this.self.refreshAttackID();
            this.self.modifyKBConstant(25);
            this.self.modifyRefreshRate(50);
            this.self.modifyHitStun(1);
            this.self.modifyHitLag(0);
            this.self.modifyAttackPower(1300);
        }

        internal function frame248():*
        {
            this.self.refreshAttackID();
            this.self.modifyKBConstant(1);
            this.self.modifyRefreshRate(3);
            this.self.modifyHitStun(5);
            this.self.modifyHitLag(0.95);
            this.self.modifyAttackPower(900);
        }

        internal function frame271():*
        {
            this.self.refreshAttackID();
            this.self.modifyKBConstant(25);
            this.self.modifyRefreshRate(50);
            this.self.modifyHitStun(1);
            this.self.modifyHitLag(0);
            this.self.modifyAttackPower(1300);
        }

        internal function frame281():*
        {
            stop();
        }

        internal function frame282():*
        {
            gotoAndStop("end");
        }


    }
}//package 

