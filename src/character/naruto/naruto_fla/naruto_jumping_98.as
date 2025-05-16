// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//naruto_fla.naruto_jumping_98

package naruto_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class naruto_jumping_98 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;
        public var xframe:*;
        public var done:*;

        public function naruto_jumping_98()
        {
            addFrameScript(0, this.frame1, 5, this.frame6);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.xframe = "midair";
            this.done = false;
            if (((this.self) && (SSF2API.isReady())))
            {
                SSF2API.playSound("Naruto_jump_air");
            };
        }

        internal function frame6():*
        {
            this.done = true;
            gotoAndPlay("redo");
        }


    }
}//package naruto_fla

