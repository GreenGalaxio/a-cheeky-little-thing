// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//naruto_summonClone

package 
{
    import flash.display.MovieClip;

    public dynamic class naruto_summonClone extends MovieClip 
    {

        public function naruto_summonClone()
        {
            addFrameScript(10, this.frame11);
        }

        internal function frame11():*
        {
            if (((!(root == null)) && (!(parent == null))))
            {
                parent.removeChild(this);
            };
        }


    }
}//package 

