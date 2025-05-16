// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//naruto_fla.new_crouch_147

package naruto_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class new_crouch_147 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;
        public var moving:Boolean;

        public function new_crouch_147()
        {
            addFrameScript(0, this.frame1, 5, this.frame6, 6, this.frame7, 7, this.frame8, 18, this.frame19);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.moving = false;
        }

        internal function frame6():*
        {
            this.moving = false;
        }

        internal function frame7():*
        {
            this.gotoAndPlay("redo");
        }

        internal function frame8():*
        {
            this.moving = true;
        }

        internal function frame19():*
        {
            gotoAndPlay("walking");
        }


    }
}//package naruto_fla

